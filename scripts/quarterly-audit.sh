#!/bin/bash
# =============================================================================
# Quarterly Vault Audit Script
# =============================================================================
# Comprehensive audit of vault health and structure
# Run quarterly or before major releases
# Usage: ./scripts/quarterly-audit.sh [--report FILE]
# =============================================================================

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color

# Configuration
VAULT_ROOT="${VAULT_ROOT:-.}"
REPORT_FILE="${REPORT_FILE:-}"
QUIET_MODE="${QUIET_MODE:-false}"

# Counters for report
CHECKS_PASSED=0
CHECKS_FAILED=0
CHECKS_WARNINGS=0

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --report|-r)
            REPORT_FILE="$2"
            shift 2
            ;;
        --quiet|-q)
            QUIET_MODE=true
            shift
            ;;
        --help|-h)
            echo "Usage: $0 [--report FILE] [--quiet] [--help]"
            echo ""
            echo "Options:"
            echo "  --report, -r    Save detailed report to file"
            echo "  --quiet, -q     Suppress console output"
            echo "  --help, -h      Show this help"
            echo ""
            echo "Environment:"
            echo "  VAULT_ROOT      - Vault root directory"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Initialize report
init_report() {
    if [[ -n "$REPORT_FILE" ]]; then
        cat > "$REPORT_FILE" << EOF
# Quarterly Vault Audit Report

**Date:** $(date -u +"%Y-%m-%d %H:%M UTC")  
**Vault Root:** $(cd "$VAULT_ROOT" && pwd)

## Summary

| Metric | Value |
|--------|-------|
EOF
    fi
}

# Logging functions
log() {
    [[ "$QUIET_MODE" == "false" ]] && echo -e "$@"
}

log_section() {
    log ""
    log "${MAGENTA}══════════════════════════════════════════════════════════════${NC}"
    log "${MAGENTA}  $1${NC}"
    log "${MAGENTA}══════════════════════════════════════════════════════════════${NC}"
    
    if [[ -n "$REPORT_FILE" ]]; then
        echo "" >> "$REPORT_FILE"
        echo "## $1" >> "$REPORT_FILE"
        echo "" >> "$REPORT_FILE"
    fi
}

log_pass() {
    log "${GREEN}✓ PASS${NC} $1"
    CHECKS_PASSED=$((CHECKS_PASSED + 1))
    
    if [[ -n "$REPORT_FILE" ]]; then
        echo "- ✓ $1" >> "$REPORT_FILE"
    fi
}

log_fail() {
    log "${RED}✗ FAIL${NC} $1"
    CHECKS_FAILED=$((CHECKS_FAILED + 1))
    
    if [[ -n "$REPORT_FILE" ]]; then
        echo "- ✗ $1" >> "$REPORT_FILE"
    fi
}

log_warn() {
    log "${YELLOW}! WARN${NC} $1"
    CHECKS_WARNINGS=$((CHECKS_WARNINGS + 1))
    
    if [[ -n "$REPORT_FILE" ]]; then
        echo "- ! $1" >> "$REPORT_FILE"
    fi
}

log_info() {
    log "${BLUE}ℹ INFO${NC} $1"
    
    if [[ -n "$REPORT_FILE" ]]; then
        echo "- ℹ $1" >> "$REPORT_FILE"
    fi
}

# Audit: Directory Structure
audit_structure() {
    log_section "Directory Structure"
    
    local required_dirs=("MOCs" "Topics" "ADRs" "Daily Notes")
    local optional_dirs=("Clippings" "Attachments" "Templates" "Excalidraw")
    
    for dir in "${required_dirs[@]}"; do
        if [[ -d "$VAULT_ROOT/$dir" ]]; then
            local count=$(find "$VAULT_ROOT/$dir" -name "*.md" -type f 2>/dev/null | wc -l)
            log_pass "Required directory '$dir' exists ($count files)"
        else
            log_fail "Required directory '$dir' missing"
        fi
    done
    
    for dir in "${optional_dirs[@]}"; do
        if [[ -d "$VAULT_ROOT/$dir" ]]; then
            log_pass "Optional directory '$dir' exists"
        else
            log_warn "Optional directory '$dir' not present"
        fi
    done
}

# Audit: Wiki-Links
audit_links() {
    log_section "Wiki-Links Validation"
    
    if [[ -x "$VAULT_ROOT/scripts/validate-links.sh" ]]; then
        log_info "Running link validator..."
        
        if "$VAULT_ROOT/scripts/validate-links.sh" --quiet; then
            log_pass "All wiki-links are valid"
        else
            log_fail "Broken wiki-links detected"
            
            if [[ -n "$REPORT_FILE" ]]; then
                echo "" >> "$REPORT_FILE"
                echo "### Broken Links" >> "$REPORT_FILE"
                echo "" >> "$REPORT_FILE"
                echo "\`\`\`" >> "$REPORT_FILE"
                "$VAULT_ROOT/scripts/validate-links.sh" --quiet 2>&1 >> "$REPORT_FILE" || true
                echo "\`\`\`" >> "$REPORT_FILE"
            fi
        fi
    else
        log_fail "Link validator script not found or not executable"
    fi
}

# Audit: ADRs
audit_adrs() {
    log_section "ADRs Validation"
    
    if [[ -d "$VAULT_ROOT/ADRs" ]]; then
        local adr_count=$(find "$VAULT_ROOT/ADRs" -name "ADR-*.md" -type f 2>/dev/null | wc -l)
        log_info "Found $adr_count ADR files"
        
        if [[ $adr_count -eq 0 ]]; then
            log_warn "No ADRs found"
        else
            log_pass "$adr_count ADRs found"
            
            # Check ADR numbering
            local numbers=$(find "$VAULT_ROOT/ADRs" -name "ADR-*.md" | grep -oE 'ADR-[0-9]+' | grep -oE '[0-9]+' | sort -n)
            local expected=1
            local gaps=0
            
            for num in $numbers; do
                if [[ $num -ne $expected ]]; then
                    gaps=$((gaps + 1))
                fi
                expected=$((expected + 1))
            done
            
            if [[ $gaps -eq 0 ]]; then
                log_pass "ADR numbering is sequential"
            else
                log_warn "ADR numbering has gaps"
            fi
        fi
    else
        log_fail "ADRs directory not found"
    fi
}

# Audit: Topics Coverage
audit_topics() {
    log_section "Topics Coverage"
    
    if [[ -d "$VAULT_ROOT/Topics" ]]; then
        local total_topics=$(find "$VAULT_ROOT/Topics" -name "*.md" -type f 2>/dev/null | wc -l)
        log_info "Total Topics: $total_topics"
        
        # Count by category
        local categories=("Arquitectura" "BD" "Testing" "Seguridad" "Bug" "API" "Frontend" "Backend" "Negocio" "DevOps" "Proyecto" "Doc" "Herramienta")
        
        for cat in "${categories[@]}"; do
            local count=$(find "$VAULT_ROOT/Topics" -name "$cat - *.md" 2>/dev/null | wc -l)
            if [[ $count -gt 0 ]]; then
                log_pass "$cat: $count topics"
            fi
        done
        
        # Check for topics without category prefix
        local no_prefix=$(find "$VAULT_ROOT/Topics" -name "*.md" ! -name "* - *.md" 2>/dev/null | wc -l)
        if [[ $no_prefix -gt 0 ]]; then
            log_warn "$no_prefix topics without category prefix"
        fi
        
        log_pass "Topics coverage analysis complete"
    else
        log_fail "Topics directory not found"
    fi
}

# Audit: Daily Notes
audit_daily_notes() {
    log_section "Daily Notes"
    
    if [[ -d "$VAULT_ROOT/Daily Notes" ]]; then
        local daily_count=$(find "$VAULT_ROOT/Daily Notes" -name "*.md" -type f 2>/dev/null | wc -l)
        log_info "Found $daily_count daily notes"
        
        # Check for recent notes (last 30 days)
        local recent_count=$(find "$VAULT_ROOT/Daily Notes" -name "*.md" -mtime -30 2>/dev/null | wc -l)
        log_info "$recent_count notes in last 30 days"
        
        # Check naming convention (YYYY-MM-DD.md)
        local correct_format=$(find "$VAULT_ROOT/Daily Notes" -name "[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9].md" 2>/dev/null | wc -l)
        local total_format=$((daily_count))
        
        if [[ $correct_format -eq $total_format && $total_format -gt 0 ]]; then
            log_pass "All daily notes follow naming convention"
        elif [[ $total_format -gt 0 ]]; then
            log_warn "Some daily notes don't follow naming convention"
        fi
    else
        log_fail "Daily Notes directory not found"
    fi
}

# Audit: MOCs
audit_mocs() {
    log_section "MOCs Validation"
    
    if [[ -d "$VAULT_ROOT/MOCs" ]]; then
        local moc_count=$(find "$VAULT_ROOT/MOCs" -name "*.md" -type f 2>/dev/null | wc -l)
        log_info "Found $moc_count MOCs"
        
        # Check for README or Start Here
        if [[ -f "$VAULT_ROOT/README.md" ]] || [[ -f "$VAULT_ROOT/Start Here.md" ]]; then
            log_pass "Entry point file exists (README.md or Start Here.md)"
        else
            log_warn "No entry point file found (README.md or Start Here.md)"
        fi
        
        log_pass "MOCs validation complete"
    else
        log_fail "MOCs directory not found"
    fi
}

# Audit: Test Counts
audit_tests() {
    log_section "Test Counts"
    
    if [[ -x "$VAULT_ROOT/scripts/count-tests.sh" ]]; then
        log_info "Running test counter..."
        
        if "$VAULT_ROOT/scripts/count-tests.sh" --quiet; then
            log_pass "Test counts match documented values"
        else
            log_warn "Test counts don't match documented values"
            
            if [[ -n "$REPORT_FILE" ]]; then
                echo "" >> "$REPORT_FILE"
                echo "### Test Count Details" >> "$REPORT_FILE"
                echo "" >> "$REPORT_FILE"
                echo "\`\`\`" >> "$REPORT_FILE"
                "$VAULT_ROOT/scripts/count-tests.sh" 2>&1 >> "$REPORT_FILE" || true
                echo "\`\`\`" >> "$REPORT_FILE"
            fi
        fi
    else
        log_warn "Test counter script not found"
    fi
}

# Audit: AGENTS.md
audit_agents_md() {
    log_section "AGENTS.md"
    
    if [[ -f "$VAULT_ROOT/AGENTS.md" ]]; then
        log_pass "AGENTS.md exists"
        
        # Check for required sections
        local required_sections=("Build" "Test" "Architecture")
        for section in "${required_sections[@]}"; do
            if grep -q "$section" "$VAULT_ROOT/AGENTS.md"; then
                log_pass "Section '$section' found in AGENTS.md"
            else
                log_warn "Section '$section' not found in AGENTS.md"
            fi
        done
    else
        log_fail "AGENTS.md not found"
    fi
}

# Generate final summary
print_summary() {
    log_section "Audit Summary"
    
    local total=$((CHECKS_PASSED + CHECKS_FAILED + CHECKS_WARNINGS))
    
    log_info "Total checks: $total"
    log_pass "Passed: $CHECKS_PASSED"
    log_fail "Failed: $CHECKS_FAILED"
    log_warn "Warnings: $CHECKS_WARNINGS"
    
    # Add to report file
    if [[ -n "$REPORT_FILE" ]]; then
        # Update summary section at the top
        local temp_file=$(mktemp)
        head -7 "$REPORT_FILE" > "$temp_file"
        cat >> "$temp_file" << EOF
| Total Checks | $total |
| Passed | $CHECKS_PASSED |
| Failed | $CHECKS_FAILED |
| Warnings | $CHECKS_WARNINGS |

## Details

EOF
        tail -n +8 "$REPORT_FILE" >> "$temp_file"
        mv "$temp_file" "$REPORT_FILE"
        
        # Add final status
        cat >> "$REPORT_FILE" << EOF

## Final Status

$(if [[ $CHECKS_FAILED -eq 0 ]]; then echo "✅ **AUDIT PASSED**"; else echo "❌ **AUDIT FAILED**"; fi)

---
*Generated by quarterly-audit.sh*
EOF
    fi
    
    if [[ $CHECKS_FAILED -eq 0 ]]; then
        log ""
        log "${GREEN}══════════════════════════════════════════════════════════════${NC}"
        log "${GREEN}  QUARTERLY AUDIT PASSED ✓${NC}"
        log "${GREEN}══════════════════════════════════════════════════════════════${NC}"
        return 0
    else
        log ""
        log "${RED}══════════════════════════════════════════════════════════════${NC}"
        log "${RED}  QUARTERLY AUDIT FAILED ✗${NC}"
        log "${RED}══════════════════════════════════════════════════════════════${NC}"
        return 1
    fi
}

# Main execution
main() {
    log ""
    log "${CYAN}╔══════════════════════════════════════════════════════════════╗${NC}"
    log "${CYAN}║       QUARTERLY VAULT AUDIT                                  ║${NC}"
    log "${CYAN}╚══════════════════════════════════════════════════════════════╝${NC}"
    log ""
    log_info "Starting audit of vault at: $(cd "$VAULT_ROOT" && pwd)"
    log_info "Report file: ${REPORT_FILE:-none}"
    
    init_report
    
    # Run all audits
    audit_structure
    audit_links
    audit_adrs
    audit_topics
    audit_daily_notes
    audit_mocs
    audit_tests
    audit_agents_md
    
    # Print summary
    print_summary
    exit $?
}

# Run main
main "$@"
