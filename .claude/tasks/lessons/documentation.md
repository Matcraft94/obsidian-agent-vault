# Lessons: Documentation Synchronization

## Critical Lessons

### Lesson 1: Documentation Drift is Real
**Problem:** Test counts were 40-70% outdated across documentation files
**Impact:** Decisions based on incorrect data
**Root Cause:** Multiple sources of truth, manual updates
**Solution:** Automate counting, single source of truth

### Lesson 2: Verify Before Link
**Problem:** Wiki-links to non-existent Topics
**Impact:** Broken references, confusion
**Root Cause:** Created documentation before ensuring targets exist
**Solution:** Pre-commit validation of all [[...]] links

### Lesson 3: Aspirational Documentation
**Problem:** Documented tests that don't exist
**Impact:** False sense of completion, misled stakeholders
**Root Cause:** Writing "what should be" instead of "what is"
**Solution:** Verify existence before documenting

### Lesson 4: Implementation Without Integration
**Problem:** Code exists but not integrated/tested
**Impact:** Feature inaccessible, wasted effort
**Root Cause:** Marking tasks complete without end-to-end verification
**Solution:** Integration test mandatory

### Lesson 5: Silent Assumptions
**Problem:** Assumed team knew conventions without documenting
**Impact:** Inconsistent application of patterns
**Root Cause:** Undocumented tribal knowledge
**Solution:** Document every convention explicitly

### Lesson 6: Stale ADRs
**Problem:** ADRs created but never updated when decisions changed
**Impact:** Wrong decisions referenced, confusion about current state
**Root Cause:** No process to update ADRs when decisions evolve
**Solution:** Review ADRs quarterly, update status immediately when decisions change

## Prevention Rules

1. **Zero Documentation Drift Policy** - Never allow metrics to be more than 1 day out of date
2. **Verify Before Link** - All [[...]] links must point to existing files before commit
3. **Single Source of Truth** - Counts/metrics must be auto-generated, never hardcoded
4. **Decision → ADR First** - No architectural decision without prior ADR documentation
5. **Mandatory Agent Swarm** - Minimum 3 agents for documentation-affecting changes
6. **Integration Test Mandatory** - All new features require HTTP 200 test before marking complete
7. **Documentation Before Code** - Update vault BEFORE implementing (planning phase)

## Automated Checks

```bash
# Test counts (auto-generated)
./scripts/count-tests.sh > docs/test-counts.md

# Link validation
./scripts/validate-links.sh

# Pre-commit hook
pre-commit run --all-files
```

## Documentation Synchronization Checklist

Before marking any task complete:
- [ ] Code implemented and tested
- [ ] Tests actually exist (verified with `pytest --collect-only`)
- [ ] Wiki-links validated (run `./scripts/validate-links.sh`)
- [ ] Topics created for new functionality
- [ ] ADRs updated for architectural decisions
- [ ] AGENTS.md test counts verified and updated
- [ ] MOCs updated with new topics/phases
- [ ] Daily Note links to affected areas

## Common Anti-Patterns

| Anti-Pattern | Why It's Bad | Solution |
|--------------|--------------|----------|
| Hardcoded metrics | Stale immediately | Use scripts to auto-generate |
| Links to future files | Broken references | Create target file first, then link |
| Copy-paste documentation | Inconsistency, drift | Reference single source |
| Documenting intentions | Never matches reality | Document what IS, not what SHOULD BE |
| One-time doc creation | Becomes stale | Schedule quarterly reviews |

## Emergency Fixes

**When documentation is found to be wrong:**
1. STOP and fix immediately
2. Update AGENTS.md lessons with root cause
3. Fix the documentation
4. If metric-related, add automated check to prevent recurrence
5. Communicate to team what was wrong and how to avoid

## Corrections Applied

<!-- Add corrections here as they happen -->

- 2026-03-08: Created comprehensive documentation lessons based on drift patterns
- 2026-03-08: Established automated check requirements for all metrics
