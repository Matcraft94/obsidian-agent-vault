#!/bin/bash
# =============================================================================
# Vault Structure Checker
# =============================================================================
# Validates the basic directory structure of an Obsidian vault
# Used by pre-commit hook
# =============================================================================

set -euo pipefail

errors=0

if [[ ! -d "MOCs" ]]; then
    echo "Error: Missing MOCs/ directory"
    errors=1
fi

if [[ ! -d "Topics" ]]; then
    echo "Error: Missing Topics/ directory"
    errors=1
fi

if [[ ! -d "ADRs" ]]; then
    echo "Error: Missing ADRs/ directory"
    errors=1
fi

if [[ ! -d "Daily Notes" ]]; then
    echo "Error: Missing Daily Notes/ directory"
    errors=1
fi

exit $errors
