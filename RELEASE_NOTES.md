# Release Notes v1.0.0

## 🎉 Initial Stable Release

**Date:** 2026-03-05  
**Version:** 1.0.0  
**Codename:** Agent Vault

---

## ✨ What's New

### AI Agent Operating Guidelines
Six core principles for AI agents working with this vault:

1. **Plan Mode First** - Use plan mode for non-trivial tasks (3+ steps)
2. **Subagent Strategy** - Delegate research and analysis to subagents
3. **Self-Improvement Loop** - Document corrections in lessons files
4. **Verification Before Done** - Prove it works before marking complete
5. **Demand Elegance** - Seek elegant solutions, avoid hacky fixes
6. **Autonomous Bug Fixing** - Resolve bugs without hand-holding

### Lessons System
Organized continuous learning with 8 categorized topics:
- `architecture` - Clean Architecture, patterns, decisions
- `testing` - pytest, Vitest, coverage, E2E
- `vault` - Obsidian conventions, documentation
- `domain` - Business logic, FSMs, value objects
- `api` - DRF, serializers, permissions
- `frontend` - Vue, React, TypeScript
- `workflow` - Planning, subagents, verification
- `general` - Uncategorized lessons

### Bilingual Structure
Complete template in two languages:
- 🇪🇸 `es/` - Fully translated Spanish version
- 🇬🇧 `en/` - Template structure (translate contents to English)

### 10 Essential MOCs

#### For Software Projects
- **Start Here** - Entry point with navigation
- **Proyecto - TODOs** - Task tracking
- **Implementation Progress** - Development status and metrics
- **Architecture Decisions** - ADR index and decisions
- **Testing Strategy** - Testing pyramid and metrics
- **API Documentation** - Endpoints and schemas
- **Bug Tracker** - Issue tracking by severity
- **Security & Privacy** - Security measures and policies

#### For Research Projects
- **Research Progress** - Research status and literature

#### For All Projects
- **Agent Workflow & Lessons** - Agent guidelines and learning system

### 12 Templates

#### Core Templates
- **ADR.md** - Architecture Decision Records
- **Fase.md** - Phase structure (Fase X)
- **Paso.md** - Step structure (Paso X.Y)
- **Topic.md** - Atomic notes
- **Daily Note.md** - Daily journal index
- **Daily Detail.md** - Detailed session notes

#### New Templates
- **Lesson Entry.md** - Format for agent lessons
- **Sync Checklist.md** - Repo↔Vault synchronization checklist
- **Bug Fix.md** - Bug documentation
- **Refactor.md** - Refactoring notes
- **research.md** - Research notes
- **resource.md** - Bibliographic resources
- **brainstorm.md** - Brainstorming sessions

### Workflow Features

#### Repo ↔ Vault Sync
Complete synchronization workflow with:
- Event mapping table (Repo action → Vault update)
- Pre-commit checklist
- Priority levels (HIGH/MEDIUM/LOW)
- Recommended workflow

#### Skills System
Placeholder skills for multi-agent support:
- `[PROJECT]-vault-reader` - Query vault information
- `[PROJECT]-vault-writer` - Create/update documentation
- `[PROJECT]-vault-daily` - Create Daily Notes
- `[PROJECT]-vault-commit` - Commit vault changes

### Documentation

#### AGENTS.md
Complete guide for AI agents including:
- AI Agent Operating Guidelines
- Task Management (vault-only TODOs)
- Core Principles (Simplicity, No Laziness, Minimal Impact)
- Vault structure and conventions
- Naming conventions (Fases, Pasos, Topics)
- Sync workflow documentation

#### CLAUDE.md
Project-specific guide with:
- Vault location and conventions
- Agent Workflow Guidelines reference
- Phase naming conventions
- Build/test/lint commands
- Architecture overview

#### SETUP_GUIDE.md
Step-by-step setup guide:
- Configuration instructions
- IDE setup (Claude, Copilot, OpenCode, Kimi)
- MOCs selection by project type
- Git workflow
- Plugin recommendations

---

## 📦 Installation

### Quick Start

1. **Clone or download** this repository
2. **Copy** either `es/` or `en/` folder to your project
3. **Configure** `AGENTS.md` and `CLAUDE.md` with your project info
4. **Open** in Obsidian as a vault
5. **Start working** with your AI agent!

### Directory Structure

```
vault/
├── AGENTS.md              # Agent guidelines
├── CLAUDE.md              # Project specifics
├── MOCs/                  # 10 Maps of Content
│   ├── Start Here.md
│   ├── Proyecto - TODOs.md
│   └── ...
├── Templates/             # 12 templates
│   ├── ADR.md
│   ├── Lesson Entry.md
│   └── ...
├── Topics/                # Atomic notes (FLAT)
├── Daily Notes/           # Daily journals
├── ADRs/                  # Architecture decisions
└── .obsidian/             # Obsidian config
```

---

## 🎯 Use Cases

### Software Development
- Django + DRF + PostgreSQL
- Vue.js + TypeScript + Tailwind
- Docker + Docker Compose
- Modular Monolith + Clean Architecture

### Research Projects
- Literature review tracking
- Methodology documentation
- Experiments and analysis
- Publications management

### Data Projects
- Dataset documentation
- Analysis pipelines
- Visualization guides
- Model registries

---

## 🔧 IDE Support

### Claude Code
Create `CLAUDE.md` in your code repo pointing to the vault.

### GitHub Copilot
Create `.github/copilot-instructions.md` with vault location.

### OpenCode
Create `.opencode/instructions.md` with vault references.

### Kimi CLI
Install `obsidian-vault-querier` skill and configure path.

---

## 🎨 Customization

### Colors
Cyberpunk color system for graph visualization:
- **Cyan neon** - Daily notes
- **Magenta neon** - MOCs
- **Lime neon** - Technical topics
- **Gold neon** - Business topics
- **Electric blue** - Architecture
- **Bright green** - Database
- **Hot pink** - Testing

### Templates
Modify templates in `Templates/` folder to match your needs.

### MOCs
Add/remove MOCs based on your project type.

---

## 📝 Changelog

See [CHANGELOG.md](./CHANGELOG.md) for detailed change history.

---

## 🤝 Contributing

Contributions are welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

---

## 📄 License

This project is licensed under the MIT License - see [LICENSE](./LICENSE) file for details.

---

## 🙏 Acknowledgments

Created with love by:
- **Lucy** - Project owner
- **Claude Code** - AI assistant
- **Kimi CLI** - AI assistant
- **OpenCode** - AI assistant

Special thanks to the Obsidian community and Zettelkasten practitioners.

---

## 🔗 Links

- **Repository:** https://github.com/lmendezr/obsidian-agent-vault
- **Issues:** https://github.com/lmendezr/obsidian-agent-vault/issues
- **Documentation:** See README.md and SETUP_GUIDE.md

---

**Ready to supercharge your AI-assisted workflow?** 🚀

Download now and start building your Second Brain!
