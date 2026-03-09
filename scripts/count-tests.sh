#!/bin/bash
# =============================================================================
# Test Counter Script
# =============================================================================
# Generic test counter that works with any testing framework
# Supports: pytest, vitest, jest, mocha, go test, cargo test
# Usage: ./scripts/count-tests.sh [--update] [--quiet]
# =============================================================================

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Configuration
PROJECT_ROOT="${PROJECT_ROOT:-.}"
AGENTS_MD="${AGENTS_MD:-AGENTS.md}"
UPDATE_MODE="${UPDATE_MODE:-false}"
QUIET_MODE="${QUIET_MODE:-false}"

# Counters
TOTAL_TESTS=0
BACKEND_TESTS=0
FRONTEND_TESTS=0
E2E_TESTS=0

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --update|-u)
            UPDATE_MODE=true
            shift
            ;;
        --quiet|-q)
            QUIET_MODE=true
            shift
            ;;
        --help|-h)
            echo "Usage: $0 [--update] [--quiet] [--help]"
            echo ""
            echo "Options:"
            echo "  --update, -u    Update AGENTS.md with actual counts"
            echo "  --quiet, -q     Suppress output (for CI)"
            echo "  --help, -h      Show this help"
            echo ""
            echo "Environment:"
            echo "  PROJECT_ROOT    - Project root directory"
            echo "  AGENTS_MD       - Path to AGENTS.md file"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Logging
log() {
    [[ "$QUIET_MODE" == "false" ]] && echo -e "$@"
}

log_info() {
    log "${BLUE}[INFO]${NC} $1"
}

log_ok() {
    log "${GREEN}[OK]${NC} $1"
}

log_warn() {
    log "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    log "${RED}[ERROR]${NC} $1"
}

# Function to count pytest tests
count_pytest() {
    local count=0
    if command -v pytest &>/dev/null || [[ -f "$PROJECT_ROOT/pytest.ini" ]] || [[ -f "$PROJECT_ROOT/requirements.txt" ]]; then
        # Try to collect tests without running
        if command -v pytest &>/dev/null; then
            count=$(pytest --collect-only -q 2>/dev/null | tail -1 | grep -oE '[0-9]+' | head -1 || echo "0")
        fi
        # Fallback: count test files
        if [[ "$count" == "0" ]]; then
            count=$(find "$PROJECT_ROOT" -name "test_*.py" -o -name "*_test.py" 2>/dev/null | wc -l)
        fi
    fi
    echo "$count"
}

# Function to count vitest tests
count_vitest() {
    local count=0
    if [[ -f "$PROJECT_ROOT/vitest.config.ts" ]] || [[ -f "$PROJECT_ROOT/vitest.config.js" ]]; then
        if command -v npx &>/dev/null && [[ -f "$PROJECT_ROOT/package.json" ]]; then
            count=$(cd "$PROJECT_ROOT" && npx vitest run --reporter=verbose 2>/dev/null | grep -oE '[0-9]+ passed' | head -1 | grep -oE '[0-9]+' || echo "0")
        fi
        # Fallback: count test files
        if [[ "$count" == "0" ]]; then
            count=$(find "$PROJECT_ROOT" -name "*.spec.ts" -o -name "*.test.ts" -o -name "*.spec.js" -o -name "*.test.js" 2>/dev/null | wc -l)
        fi
    fi
    echo "$count"
}

# Function to count jest tests
count_jest() {
    local count=0
    if [[ -f "$PROJECT_ROOT/jest.config.js" ]] || [[ -f "$PROJECT_ROOT/jest.config.ts" ]]; then
        if command -v npx &>/dev/null && [[ -f "$PROJECT_ROOT/package.json" ]]; then
            count=$(cd "$PROJECT_ROOT" && npx jest --listTests 2>/dev/null | wc -l)
        fi
        # Fallback
        if [[ "$count" == "0" ]]; then
            count=$(find "$PROJECT_ROOT" -name "*.test.js" -o -name "*.test.ts" 2>/dev/null | wc -l)
        fi
    fi
    echo "$count"
}

# Function to count Go tests
count_go_tests() {
    local count=0
    if [[ -f "$PROJECT_ROOT/go.mod" ]]; then
        if command -v go &>/dev/null; then
            count=$(cd "$PROJECT_ROOT" && go test -list=. ./... 2>/dev/null | grep -c "^Test" || echo "0")
        fi
        # Fallback
        if [[ "$count" == "0" ]]; then
            count=$(find "$PROJECT_ROOT" -name "*_test.go" 2>/dev/null | wc -l)
        fi
    fi
    echo "$count"
}

# Function to count Rust tests
count_cargo_tests() {
    local count=0
    if [[ -f "$PROJECT_ROOT/Cargo.toml" ]]; then
        if command -v cargo &>/dev/null; then
            count=$(cd "$PROJECT_ROOT" && cargo test --no-run 2>&1 | grep -oE "[0-9]+ tests" | tail -1 | grep -oE "[0-9]+" || echo "0")
        fi
        # Fallback
        if [[ "$count" == "0" ]]; then
            count=$(find "$PROJECT_ROOT" -name "*.rs" -exec grep -l "#\[test\]" {} \; 2>/dev/null | wc -l)
        fi
    fi
    echo "$count"
}

# Function to count Playwright E2E tests
count_playwright() {
    local count=0
    if [[ -d "$PROJECT_ROOT/e2e" ]] || [[ -f "$PROJECT_ROOT/playwright.config.ts" ]] || [[ -f "$PROJECT_ROOT/playwright.config.js" ]]; then
        # Count spec files
        count=$(find "$PROJECT_ROOT/e2e" -name "*.spec.ts" -o -name "*.spec.js" 2>/dev/null | wc -l)
        # Count individual tests within files
        if [[ $count -gt 0 ]]; then
            local test_count=$(find "$PROJECT_ROOT/e2e" -name "*.spec.ts" -o -name "*.spec.js" 2>/dev/null | xargs grep -c "test(" 2>/dev/null | awk -F: '{sum+=$2} END {print sum}')
            [[ -n "$test_count" && "$test_count" -gt 0 ]] && count=$test_count
        fi
    fi
    echo "$count"
}

# Function to get documented count from AGENTS.md
get_documented_count() {
    local pattern="$1"
    local count=0
    if [[ -f "$PROJECT_ROOT/$AGENTS_MD" ]]; then
        count=$(grep -oE "$pattern" "$PROJECT_ROOT/$AGENTS_MD" 2>/dev/null | grep -oE '[0-9]+' | head -1 || echo "0")
    fi
    echo "$count"
}

# Function to update AGENTS.md
update_agents_md() {
    local backend=$1
    local frontend=$2
    local e2e=$3
    
    if [[ ! -f "$PROJECT_ROOT/$AGENTS_MD" ]]; then
        log_warn "AGENTS.md not found, skipping update"
        return 1
    fi
    
    log_info "Updating AGENTS.md with actual test counts..."
    
    # Create backup
    cp "$PROJECT_ROOT/$AGENTS_MD" "$PROJECT_ROOT/$AGENTS_MD.bak"
    
    # Update backend tests
    if [[ $backend -gt 0 ]]; then
        sed -i "s/[~]\?[0-9]\+ backend tests/[~]$backend backend tests/g" "$PROJECT_ROOT/$AGENTS_MD" 2>/dev/null || true
        sed -i "s/[~]\?[0-9]\+ API tests/[~]$backend API tests/g" "$PROJECT_ROOT/$AGENTS_MD" 2>/dev/null || true
    fi
    
    # Update frontend tests
    if [[ $frontend -gt 0 ]]; then
        sed -i "s/[~]\?[0-9]\+ frontend tests/[~]$frontend frontend tests/g" "$PROJECT_ROOT/$AGENTS_MD" 2>/dev/null || true
        sed -i "s/[~]\?[0-9]\+ Vitest tests/[~]$frontend Vitest tests/g" "$PROJECT_ROOT/$AGENTS_MD" 2>/dev/null || true
    fi
    
    # Update E2E tests
    if [[ $e2e -gt 0 ]]; then
        sed -i "s/[~]\?[0-9]\+ E2E tests/[~]$e2e E2E tests/g" "$PROJECT_ROOT/$AGENTS_MD" 2>/dev/null || true
        sed -i "s/[~]\?[0-9]\+ Playwright tests/[~]$e2e Playwright tests/g" "$PROJECT_ROOT/$AGENTS_MD" 2>/dev/null || true
    fi
    
    # Update total
    local total=$((backend + frontend + e2e))
    if [[ $total -gt 0 ]]; then
        sed -i "s/[~]\?[0-9]\+ tests total/[~]$total tests total/g" "$PROJECT_ROOT/$AGENTS_MD" 2>/dev/null || true
        sed -i "s/[~]\?[0-9]\+ unit tests/[~]$total unit tests/g" "$PROJECT_ROOT/$AGENTS_MD" 2>/dev/null || true
    fi
    
    # Remove backup
    rm -f "$PROJECT_ROOT/$AGENTS_MD.bak"
    
    log_ok "AGENTS.md updated successfully"
}

# Main function
main() {
    log ""
    log "${CYAN}========================================${NC}"
    log "${CYAN}       TEST COUNT REPORT              ${NC}"
    log "${CYAN}========================================${NC}"
    log ""
    
    # Detect and count tests for each type
    log_info "Detecting test frameworks..."
    
    BACKEND_TESTS=$(count_pytest)
    if [[ $BACKEND_TESTS -eq 0 ]]; then
        BACKEND_TESTS=$(count_go_tests)
    fi
    if [[ $BACKEND_TESTS -eq 0 ]]; then
        BACKEND_TESTS=$(count_cargo_tests)
    fi
    
    FRONTEND_TESTS=$(count_vitest)
    if [[ $FRONTEND_TESTS -eq 0 ]]; then
        FRONTEND_TESTS=$(count_jest)
    fi
    
    E2E_TESTS=$(count_playwright)
    
    TOTAL_TESTS=$((BACKEND_TESTS + FRONTEND_TESTS + E2E_TESTS))
    
    # Get documented counts
    local doc_backend=$(get_documented_count "[0-9]+ backend tests\|[0-9]+ API tests")
    local doc_frontend=$(get_documented_count "[0-9]+ frontend tests\|[0-9]+ Vitest tests")
    local doc_e2e=$(get_documented_count "[0-9]+ E2E tests\|[0-9]+ Playwright tests")
    local doc_total=$(get_documented_count "[0-9]+ tests total")
    
    # Display results
    log ""
    log "${BLUE}Test Count Comparison:${NC}"
    log "─────────────────────────────────────────"
    printf "%-20s %10s %10s %10s\n" "Category" "Documented" "Actual" "Status"
    log "─────────────────────────────────────────"
    
    # Backend
    local backend_status="${GREEN}✓${NC}"
    if [[ $BACKEND_TESTS -ne $doc_backend && $doc_backend -gt 0 ]]; then
        backend_status="${YELLOW}!${NC}"
    fi
    printf "%-20s %10s %10s %10b\n" "Backend" "$doc_backend" "$BACKEND_TESTS" "$backend_status"
    
    # Frontend
    local frontend_status="${GREEN}✓${NC}"
    if [[ $FRONTEND_TESTS -ne $doc_frontend && $doc_frontend -gt 0 ]]; then
        frontend_status="${YELLOW}!${NC}"
    fi
    printf "%-20s %10s %10s %10b\n" "Frontend" "$doc_frontend" "$FRONTEND_TESTS" "$frontend_status"
    
    # E2E
    local e2e_status="${GREEN}✓${NC}"
    if [[ $E2E_TESTS -ne $doc_e2e && $doc_e2e -gt 0 ]]; then
        e2e_status="${YELLOW}!${NC}"
    fi
    printf "%-20s %10s %10s %10b\n" "E2E" "$doc_e2e" "$E2E_TESTS" "$e2e_status"
    
    log "─────────────────────────────────────────"
    local total_status="${GREEN}✓${NC}"
    if [[ $TOTAL_TESTS -ne $doc_total && $doc_total -gt 0 ]]; then
        total_status="${YELLOW}!${NC}"
    fi
    printf "%-20s %10s %10s %10b\n" "TOTAL" "$doc_total" "$TOTAL_TESTS" "$total_status"
    log "─────────────────────────────────────────"
    
    # Update if requested
    if [[ "$UPDATE_MODE" == "true" ]]; then
        update_agents_md $BACKEND_TESTS $FRONTEND_TESTS $E2E_TESTS
    fi
    
    # Summary
    log ""
    if [[ $TOTAL_TESTS -eq 0 ]]; then
        log_warn "No tests detected"
        exit 0
    else
        log_ok "Total tests found: ${TOTAL_TESTS}"
    fi
    
    # Return different exit codes based on match
    if [[ $TOTAL_TESTS -ne $doc_total && $doc_total -gt 0 ]]; then
        log_warn "Test counts don't match documented values"
        exit 2  # Specific exit code for mismatch
    fi
    
    exit 0
}

# Run main
main "$@"
