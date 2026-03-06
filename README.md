# Obsidian Vault Template - Bilingual

Bilingual template (Spanish/English) for code and research projects with multi-agent support.

## 🚀 Quick Start

Choose your language:
- 🇪🇸 [Versión en Español](./es/README.md) - Completa y lista para usar
- 🇬🇧 [English Version](./en/README.md) - **Template structure** (translate contents to English)

> **Note:** The `en/` folder contains the template structure. Translate the contents to English for your project, or use the `es/` version and translate from there.

## 📁 Structure

```
vault/
├── README.md              ← This file (bilingual overview)
├── es/                    ← Spanish version
│   ├── README.md
│   ├── AGENTS.md
│   ├── CLAUDE.md
│   └── SETUP_GUIDE.md
├── en/                    ← English version  
│   ├── README.md
│   ├── AGENTS.md
│   ├── CLAUDE.md
│   └── SETUP_GUIDE.md
├── MOCs/                  ← Maps of Content (hubs)
├── Topics/                ← Atomic notes (FLAT)
├── Daily Notes/           ← Daily journals
├── ADRs/                  ← Architecture Decision Records
└── Templates/             ← Note templates
```

## 🎯 Choose Your Path

### For Development Projects
Key MOCs:
- [[Start Here]]
- [[Proyecto - TODOs]] / [[Project - TODOs]]
- [[Implementation Progress]]
- [[Architecture Decisions]]
- [[Testing Strategy]]
- [[API Documentation]]
- [[Bug Tracker]]

### For Research Projects
Key MOCs:
- [[Start Here]]
- [[Proyecto - TODOs]] / [[Project - TODOs]]
- [[Research Progress]]
- [[Literature Review]]
- [[Methodology]]
- [[Experiments]]
- [[Findings]]

### For Data Projects
Key MOCs:
- [[Start Here]]
- [[Proyecto - TODOs]] / [[Project - TODOs]]
- [[Dataset Documentation]]
- [[Analysis Pipeline]]
- [[Visualization Guide]]
- [[Model Registry]]

## 💻 IDE Setup

### Claude Code
Create `CLAUDE.md` in your code repo root pointing to the vault.

### GitHub Copilot
Create `.github/copilot-instructions.md` with vault location.

### OpenCode
Create `.opencode/instructions.md` with vault references.

### Kimi CLI
Install `obsidian-vault-querier` skill and configure path.

## 🎨 Customization

See SETUP_GUIDE in your chosen language folder.

## 🤝 Repo ↔ Vault Sync

Always update vault when:
- ✅ Completing features
- ✅ Making architectural decisions
- ✅ Fixing critical bugs
- ✅ Reaching milestones

See [[Sync Checklist]] template for details.

---

**Created by:** Lucy + Claude Code + Kimi CLI + OpenCode 
**Version:** 2.0  
**Date:** 2026-03-05
