#!/bin/bash
# =============================================================================
# Wiki-Links Validator for Obsidian Vault
# =============================================================================
# Validates that wiki-links [[...]] point to existing .md files
# Usage: ./scripts/validate-links.sh [--quiet]
# Returns: 0 (all valid) or 1 (broken links found)
# =============================================================================

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration (override with environment variables)
VAULT_ROOT="${VAULT_ROOT:-.}"
SEARCH_DIRS="${SEARCH_DIRS:-MOCs Topics ADRs Daily\ Notes}"
EXCLUDE_DIRS="${EXCLUDE_DIRS:-.git .obsidian node_modules}"
QUIET_MODE="${QUIET_MODE:-false}"

# Counters
TOTAL_LINKS=0
BROKEN_LINKS=0
VALID_LINKS=0

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --quiet|-q)
            QUIET_MODE=true
            shift
            ;;
        --help|-h)
            echo "Usage: $0 [--quiet] [--help]"
            echo ""
            echo "Environment variables:"
            echo "  VAULT_ROOT    - Root directory of vault (default: .)"
            echo "  SEARCH_DIRS   - Space-separated list of dirs to scan"
            echo "  EXCLUDE_DIRS  - Space-separated list of dirs to exclude"
            echo "  QUIET_MODE    - Set to 'true' for quiet output"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Logging functions
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

# Function to find markdown files
find_markdown_files() {
    local exclude_args=""
    for dir in $EXCLUDE_DIRS; do
        exclude_args="$exclude_args -not -path \"*/$dir/*\""
    done
    
    find "$VAULT_ROOT" -name "*.md" $exclude_args -type f 2>/dev/null || true
}

# Function to extract wiki-links from a file
extract_wikilinks() {
    local file="$1"
    # Match [[link]] or [[link|alias]], capture just the link part
    grep -oE '\[\[[^\]]+\]\]' "$file" 2>/dev/null | \
        sed -E 's/\[\[([^\]|]+).*/\1/' | \
        sort -u || true
}

# Function to normalize link to filename
normalize_link() {
    local link="$1"
    # Remove leading/trailing whitespace
    link=$(echo "$link" | xargs)
    # Replace spaces with escaped spaces for file matching
    echo "$link"
}

# Function to check if a link target exists
link_exists() {
    local link="$1"
    local normalized=$(normalize_link "$link")
    
    # Try various combinations
    # 1. Exact match
    if find "$VAULT_ROOT" -name "${normalized}.md" -type f 2>/dev/null | grep -q .; then
        return 0
    fi
    
    # 2. Match in subdirectories
    if find "$VAULT_ROOT" -name "*.md" -type f 2>/dev/null | grep -qi "/${normalized}\.md$"; then
        return 0
    fi
    
    # 3. Case-insensitive match
    if find "$VAULT_ROOT" -iname "${normalized}.md" -type f 2>/dev/null | grep -q .; then
        return 0
    fi
    
    return 1
}

# Main validation logic
main() {
    log_info "Starting wiki-link validation..."
    log_info "Vault root: $(cd "$VAULT_ROOT" && pwd)"
    
    # Collect all markdown files to check
    local files_to_check=""
    for dir in $SEARCH_DIRS; do
        if [[ -d "$VAULT_ROOT/$dir" ]]; then
            files_to_check="$files_to_check $(find "$VAULT_ROOT/$dir" -name '*.md' -type f 2>/dev/null)"
        fi
    done
    
    if [[ -z "$files_to_check" ]]; then
        log_warn "No markdown files found in search directories"
        exit 0
    fi
    
    # Remove duplicates
    files_to_check=$(echo "$files_to_check" | tr ' ' '\n' | sort -u | tr '\n' ' ')
    
    log_info "Checking files: $(echo "$files_to_check" | wc -w)"
    
    # Process each file
    for file in $files_to_check; do
        if [[ ! -f "$file" ]]; then
            continue
        fi
        
        local rel_path="${file#$VAULT_ROOT/}"
        local links=$(extract_wikilinks "$file")
        
        if [[ -z "$links" ]]; then
            continue
        fi
        
        log ""
        log "Checking: ${BLUE}${rel_path}${NC}"
        
        # Check each link
        while IFS= read -r link; do
            [[ -z "$link" ]] && continue
            
            TOTAL_LINKS=$((TOTAL_LINKS + 1))
            
            if link_exists "$link"; then
                VALID_LINKS=$((VALID_LINKS + 1))
                log "  ${GREEN}✓${NC} [[${link}]]"
            else
                BROKEN_LINKS=$((BROKEN_LINKS + 1))
                log_error "  ✗ [[${link}]] - NOT FOUND"
            fi
        done <<< "$links"
    done
    
    # Summary
    log ""
    log "=========================================="
    log_info "Validation Summary"
    log "=========================================="
    log "Total links checked: ${TOTAL_LINKS}"
    log "${GREEN}Valid links: ${VALID_LINKS}${NC}"
    
    if [[ $BROKEN_LINKS -gt 0 ]]; then
        log "${RED}Broken links: ${BROKEN_LINKS}${NC}"
        log ""
        log_error "VALIDATION FAILED"
        exit 1
    else
        log "${GREEN}Broken links: 0${NC}"
        log ""
        log_ok "ALL LINKS VALID ✓"
        exit 0
    fi
}

# Run main function
main "$@"
