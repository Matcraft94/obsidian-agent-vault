# Lessons: Vault Maintenance

## Key Patterns

### Daily Notes
- Create index first: `YYYY-MM-DD.md`
- Add detail files only if substantial content exists
- Link to topics created/modified
- Use extreme brevity (1-2 lines per bullet)

### MOC Updates
- Update when creating new topics
- Link phases and steps properly
- Keep implementation progress current
- Archive completed phases

## Quarterly Audit Protocol

**Every 3 months, perform full audit:**

1. **Link Validation**
   - Run `./scripts/validate-links.sh`
   - Fix all broken wiki-links
   - Archive or create missing targets

2. **MOC Review**
   - Verify all phases are current
   - Archive completed phases
   - Update progress percentages

3. **Topic Hygiene**
   - Ensure all Topics use categorical prefix
   - Check for orphan topics (not linked from any MOC)
   - Consolidate duplicate topics

4. **ADR Review**
   - Update status of outdated ADRs
   - Mark superseded ADRs appropriately
   - Archive deprecated decisions

5. **Metrics Verification**
   - Re-run test count scripts
   - Update any hardcoded numbers
   - Verify implementation progress matches reality

## Monthly Quick Check

**30-minute review:**
- [ ] Broken links check
- [ ] New topics linked to MOCs
- [ ] Daily Notes properly indexed
- [ ] No orphaned files in Topics/

## Weekly Review

**10-minute sync:**
- [ ] Daily Notes created this week
- [ ] Topics created this week linked
- [ ] MOCs updated with progress

## Pre-Commit Checks (Automated)

```bash
# Run before EVERY commit
./scripts/validate-links.sh
./scripts/check-orphans.sh
```

## Vault Hygiene Rules

### Naming Conventions
- **MOCs**: `Fase X - Nombre.md` (phases), `Paso X.Y - Nombre.md` (steps)
- **Topics**: `Categoria - Nombre.md` (categorical prefix mandatory)
- **ADRs**: `ADR-XXX Descripcion Breve.md` (sequential with padding)
- **Daily Notes**: `YYYY-MM-DD.md` (ISO format)

### File Organization
- **NO subfolders in Topics/** - flat structure only
- **MOCs** track phases and progress
- **ADRs** track architectural decisions
- **Daily Notes** track work chronologically

### Language
- **Consistent Spanish** (except technical terms)
- **No mixed languages** in same document
- **Technical terms** in English with explanation

### Tagging
- Use Cyberpunk color system consistently
- Tier 1 (structural): `daily`, `moc`
- Tier 2 (categories): `technical`, `business`, `tools`
- Tier 3 (specific): `architecture`, `database`, `frontend`, etc.

## Common Issues

| Issue | Detection | Solution |
|-------|-----------|----------|
| Broken wiki-links | `./scripts/validate-links.sh` | Create target or remove link |
| Orphan topics | `./scripts/check-orphans.sh` | Link to relevant MOC |
| Missing tags | Visual scan | Add appropriate tags |
| Mixed languages | Search for English/Spanish mix | Standardize to Spanish |
| Stale ADRs | Review ADRs with old dates | Update status |
| Flat structure violation | Check Topics/ for subfolders | Move to flat structure |

## Prevention Checklist

**Before adding new content:**
- [ ] Categorical prefix for Topics
- [ ] Proper tags in frontmatter
- [ ] Links to 2-3+ existing notes
- [ ] MOC updated with new content

**Before modifying existing content:**
- [ ] Check for existing links to this note
- [ ] Update dependent notes if changing structure
- [ ] Verify no broken links created

**Before archiving/deleting:**
- [ ] Check for incoming links
- [ ] Update or remove references
- [ ] Ensure no critical information lost

## Maintenance Schedule

| Task | Frequency | Time |
|------|-----------|------|
| Link validation | Pre-commit | < 1 min |
| Orphan check | Weekly | 5 min |
| MOC review | Monthly | 30 min |
| Full audit | Quarterly | 2 hours |
| ADR review | Quarterly | 1 hour |

## Emergency Procedures

**Vault becomes out of sync:**
1. Stop all new content creation
2. Run full validation: `./scripts/validate-all.sh`
3. Fix critical broken links first
4. Update AGENTS.md with lessons learned
5. Resume with stricter discipline

**Major reorganization needed:**
1. Create backup branch
2. Document current state
3. Plan reorganization in ADR
4. Execute with verification at each step
5. Update all references

## Corrections Applied

<!-- Add corrections here as they happen -->

- 2026-03-08: Established quarterly/monthly/weekly maintenance schedule
- 2026-03-08: Added automated check requirements and common issues table
