# Pull Request Template

## Description
<!-- Provide a brief description of the changes in this PR -->

## Type of Change
<!-- Mark the relevant options with an [x] -->
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] Documentation update
- [ ] Refactoring (no functional changes)
- [ ] Test additions or improvements
- [ ] Configuration/CI changes

## Pre-Submission Checklist
<!-- Ensure all items are completed before submitting -->
- [ ] Code implemented and follows project conventions
- [ ] Tests exist and pass (`pytest` / `npm run test`)
- [ ] Wiki-links validated (`./scripts/validate-links.sh`)
- [ ] Vault documentation updated (MOCs, Topics, ADRs)
- [ ] AGENTS.md updated if test counts changed (`./scripts/count-tests.sh --update`)
- [ ] No hardcoded secrets or credentials
- [ ] No breaking changes to existing APIs (or documented in "Breaking Changes")
- [ ] Documentation updated (README, inline comments, or vault Topics)

## Vault Synchronization Checklist
<!-- For template-vault projects -->
- [ ] Daily Notes created/updated if needed
- [ ] Relevant Topics created/updated
- [ ] MOCs updated with new links
- [ ] ADRs created for architectural decisions
- [ ] Wiki-links point to existing files (validated)
- [ ] Test counts in AGENTS.md are accurate

## Testing
<!-- Describe the tests you've added or run -->
- [ ] Unit tests pass
- [ ] Integration tests pass
- [ ] E2E tests pass (if applicable)
- [ ] Manual testing performed

## Test Count Verification
<!-- Run the test counter to verify -->
```bash
./scripts/count-tests.sh
```
**Result:** <!-- Paste output or note if counts match -->

## Related Issues
<!-- Link to related issues using GitHub keywords (Fixes #123, Closes #456) -->
Fixes #

## Screenshots / Evidence
<!-- If applicable, add screenshots or evidence of the changes -->

## Breaking Changes
<!-- List any breaking changes and migration instructions -->
None

## Additional Notes
<!-- Any additional context or notes for reviewers -->

---

**Reviewer Checklist:**
- [ ] Code review completed
- [ ] Documentation review completed
- [ ] Tests are adequate and pass
- [ ] Wiki-links are valid
- [ ] No security concerns
- [ ] Ready to merge
