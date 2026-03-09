# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-03-05

### Added
- AI Agent Operating Guidelines with 6 core principles:
  - Plan Mode First
  - Subagent Strategy
  - Self-Improvement Loop
  - Verification Before Done
  - Demand Elegance
  - Autonomous Bug Fixing
- Lessons System with 8 categorized topics (architecture, testing, vault, domain, api, frontend, workflow, general)
- Bilingual structure with `es/` (Spanish) and `en/` (English) folders
- 10 essential MOCs:
  - Start Here
  - Proyecto - TODOs
  - Implementation Progress
  - Research Progress
  - Architecture Decisions
  - Testing Strategy
  - API Documentation
  - Bug Tracker
  - Security & Privacy
  - Agent Workflow & Lessons
- 12 templates:
  - ADR.md
  - Daily Note.md
  - Daily Detail.md
  - Fase.md
  - Paso.md
  - Topic.md
  - Lesson Entry.md (NEW)
  - Sync Checklist.md (NEW)
  - Bug Fix.md
  - Refactor.md
  - research.md
  - resource.md
  - brainstorm.md
- MIT License
- Complete Repo↔Vault synchronization workflow documentation
- Pre-commit checklist for vault updates
- Skills placeholders system ([PROJECT]-vault-reader, writer, daily, commit)
- Cyberpunk color system for graph visualization
- Phase naming conventions (Fase X, Paso X.Y)
- Topics categorical prefixes (Arquitectura, BD, Testing, etc.)

### Changed
- Updated AGENTS.md with AI Operating Guidelines section
- Enhanced CLAUDE.md with Agent Workflow Guidelines reference
- Expanded sync documentation with complete event table
- Improved README.md with bilingual navigation

### Fixed
- Branch name changed from `master` to `main`

## [2.0.0] - 2026-03-08

### Added

#### Core Features
- **Strict Documentation Synchronization Rules** (6 critical rules)
  - Rule 1: Zero Documentation Drift Policy
  - Rule 2: Verify Before Link
  - Rule 3: Single Source of Truth
  - Rule 4: Decision → ADR First
  - Rule 5: Mandatory Agent Swarm
  - Rule 6: Integration Test Mandatory

- **Swarm Protocol** for documentation tasks
  - Minimum 3 agents requirement
  - Standard swarm compositions table
  - 6-step coordination protocol
  - Forbidden patterns documentation

#### Specialized Skills (4 new skills)
- `vault-reader` - Query vault before reading code (20+ triggers)
- `vault-writer` - Create/modify documentation (15+ triggers)
- `vault-daily` - Create Daily Notes (10+ triggers)
- `vault-commit` - Commit vault changes (10+ triggers)

#### Validation Scripts (4 scripts)
- `validate-links.sh` - Check wiki-links point to existing files
- `count-tests.sh` - Count tests vs documented
- `quarterly-audit.sh` - Comprehensive vault audit
- `check-structure.sh` - Validate required directories

#### CI/CD Integration
- `.github/workflows/docs-validation.yml` - PR + nightly validation
- `.github/workflows/nightly-tests.yml` - Compare tests vs docs
- `.pre-commit-config.yaml` - Pre-commit hooks (markdownlint, validate-links)
- `.github/pull_request_template.md` - PR checklist

#### Lessons Learned (8 files total)
**English:**
- `documentation.md` - Documentation synchronization lessons
- `testing.md` - Testing best practices
- `architecture.md` - Architecture documentation
- `vault-maintenance.md` - Maintenance protocols

**Spanish:**
- `documentacion.md` - Lecciones de sincronización
- `pruebas.md` - Mejores prácticas de pruebas
- `arquitectura.md` - Documentación de arquitectura
- `mantenimiento-vault.md` - Protocolos de mantenimiento

#### Updated Templates
- `ADR.md` - Added Status, Context, Decision, Consequences
- `Topic.md` - Added categorical prefix reminder
- `Daily Note.md` - Structured format with checkboxes
- `Fase.md` / `Paso.md` - Added test status and ADR links
- `Sync Checklist.md` - NEW template for vault-code sync

#### Bilingual Support
- Complete Spanish translations of AGENTS.md and CLAUDE.md
- README.md fully bilingual (EN/ES)
- All lessons available in both languages

### Changed
- **AGENTS.md** - Added Documentation Synchronization Rules section
- **CLAUDE.md** - Added Swarm Protocol and Verification Checklist
- **agents.yaml** - Updated with generic configuration and swarm settings
- **README.md** - Complete rewrite with bilingual documentation
- All validation scripts are framework-agnostic and configurable

### Deprecated
- Old skill placeholders system (replaced with 4 concrete skills)

### Fixed
- N/A (Initial 2.0.0 release)

### Security
- Pre-commit hooks prevent broken wiki-links
- CI/CD validation ensures documentation integrity

## [2.1.0] - 2026-03-08

### Added

#### Academic Research & Data Science Support
- **20+ New Categorical Prefixes** for research projects:
  - Mathematics: `Matemática`, `Algoritmo`, `Concepto`, `Teoría`
  - Research: `Paper`, `Bibliografía`, `Caso`, `Experimento`
  - Data Science: `Dataset`, `Modelo`, `Métrica`, `Análisis`
  - Visualization: `Figura`, `Visualización`
  - Implementation: `Implementación`, `Método`, `Proceso`, `Resultado`

#### New Specialized Skills (7 skills)
- `paper-analyzer` - Analyze academic papers, extract concepts and methodology
- `biblio-review` - Bibliographic review, BibTeX validation, identify gaps
- `latex-tikz-generator` - Generate TikZ/PGF figures following LaTeX 3D course best practices
- `data-explorer` - Dataset exploration, profiling, quality analysis
- `experiment-tracker` - ML/DL experiment tracking, metrics, reproducibility
- `methodology-validator` - Validate scientific methodologies, experimental designs
- `stats-reviewer` - Statistical review, assumption validation, test selection

#### New Templates for Research (11 templates)
- `Paper.md` - Academic paper analysis with comprehensive metadata
- `Concept.md` - Theoretical/mathematical concepts with formal definitions
- `Case Study.md` - Empirical case studies with triangulation support
- `Exercise.md` - Academic exercises with difficulty levels
- `Implementation.md` - Code implementation reviews
- `Experiment.md` - ML/DL experiment documentation with metrics
- `Dataset.md` - Dataset documentation with quality assessment
- `API.md` - API documentation template
- `Meeting.md` - Meeting notes with action items
- `Decision.md` - Extended decision records (ADR enhancement)
- `TikZ Figure.md` - Scientific figures in TikZ/PGF

#### Enhanced Base Skills
- `vault-reader` - Added 20+ academic research categorical prefixes
- `vault-writer` - Extended tag system with research categories
- `paper-analyzer` - Made generic for any research field (not just TDA)

#### TikZ/PGF Integration
- Best practices from LaTeX 3D Drawing Course integrated:
  - `\tdplotsetmaincoords` for 3D perspective
  - `z buffer=sort` for complex surfaces
  - `tikzmath` for variable definitions
  - Canvas projections for 2D on 3D planes
  - Colorblind-friendly color palettes

### Changed
- **Total Skills**: 4 → 11 (7 new specialized skills)
- **Total Templates**: 12 → 24 (11 new + 1 updated)
- Updated template structure to support both software and research projects
- Enhanced tag system with 3-tier hierarchy (structural, category, specificity)

### Deprecated
- N/A

### Fixed
- N/A

### Documentation
- Updated README.md with version 2.1.0 badge
- Added comprehensive skill documentation with triggers and workflows
- Documented 20+ categorical prefixes for Topics/
- Added cross-references between skills and templates

## [Unreleased]

### Planned
- Additional domain-specific specializations
- Integration with external tools (Zotero, Mendeley, etc.)
- Enhanced CI/CD workflows for research projects
