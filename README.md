# Obsidian Vault Template / Template de Vault Obsidian

![Version](https://img.shields.io/badge/version-2.1.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Status](https://img.shields.io/badge/status-stable-brightgreen)

**Bilingual template (Spanish/English) for code and research projects with multi-agent support.**

**Plantilla bilingüe (español/inglés) para proyectos de código e investigación con soporte multi-agente.**

---

## 🇬🇧 English | 🇪🇸 Español

---

## 🚀 Quick Start / Inicio Rápido

### English
1. Copy this vault to your project
2. Update PROJECT_NAME in AGENTS.md and CLAUDE.md
3. Install pre-commit hooks: `pre-commit install`
4. Configure validation scripts in `scripts/`
5. See detailed setup in `en/SETUP_GUIDE.md`

### Español
1. Copia este vault a tu proyecto
2. Actualiza PROJECT_NAME en AGENTS.md y CLAUDE.md
3. Instala pre-commit hooks: `pre-commit install`
4. Configura scripts de validación en `scripts/`
5. Ver guía detallada en `es/SETUP_GUIDE.md`

---

## 📁 Structure / Estructura

### English
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
├── MOCs/                  ← Maps of Content (project phases, decisions)
├── Topics/                ← Atomic notes (flat structure, NO subfolders)
├── Daily Notes/           ← Session logs and journals
├── ADRs/                  ← Architecture Decision Records
├── Templates/             ← Note templates
├── .claude/skills/        ← Specialized skills for vault interaction
├── scripts/               ← Validation scripts
└── .github/               ← GitHub workflows and templates
```

### Español
```
vault/
├── README.md              ← Este archivo (resumen bilingüe)
├── es/                    ← Versión en español
│   ├── README.md
│   ├── AGENTS.md
│   ├── CLAUDE.md
│   └── SETUP_GUIDE.md
├── en/                    ← Versión en inglés
│   ├── README.md
│   ├── AGENTS.md
│   ├── CLAUDE.md
│   └── SETUP_GUIDE.md
├── MOCs/                  ← Mapas de Contenido (fases del proyecto, decisiones)
├── Topics/                ← Notas atómicas (estructura plana, SIN subcarpetas)
├── Daily Notes/           ← Registros de sesión y diarios
├── ADRs/                  ← Registros de Decisiones de Arquitectura
├── Templates/             ← Plantillas de notas
├── .claude/skills/        ← Skills especializados para interacción con vault
├── scripts/               ← Scripts de validación
└── .github/               ← Workflows de GitHub y plantillas
```

---

## 🐝 Swarm Protocol / Protocolo de Enjambre

### English
For ANY documentation-affecting change, use minimum 3 agents in parallel:

| Task Type | Agents |
|-----------|--------|
| Feature Documentation | backend + frontend + testing + vault_keeper |
| Verification | backend + database + testing |
| Architecture Decisions | backend + database + vault_keeper |
| Test Counting | backend + testing |

### Español
Para CUALQUIER cambio que afecte documentación, usa mínimo 3 agentes en paralelo:

| Tipo de Tarea | Agentes |
|---------------|---------|
| Documentación de Features | backend + frontend + testing + vault_keeper |
| Verificación | backend + database + testing |
| Decisiones de Arquitectura | backend + database + vault_keeper |
| Conteo de Tests | backend + testing |

---

## 📋 Synchronization Rules / Reglas de Sincronización

### English
**Zero Documentation Drift Policy** - Before marking ANY task complete:

1. ✅ Code implemented and tested
2. ✅ Tests actually exist (verified with `pytest --collect-only`)
3. ✅ Wiki-links validated (`./scripts/validate-links.sh`)
4. ✅ Topics created for new functionality
5. ✅ ADRs updated for architectural decisions
6. ✅ AGENTS.md test counts verified and updated

### Español
**Política de Cero Desviación Documental** - Antes de marcar CUALQUIER tarea como completa:

1. ✅ Código implementado y probado
2. ✅ Tests realmente existen (verificados con `pytest --collect-only`)
3. ✅ Wiki-links validados (`./scripts/validate-links.sh`)
4. ✅ Topics creados para nueva funcionalidad
5. ✅ ADRs actualizados para decisiones arquitectónicas
6. ✅ Conteos de tests en AGENTS.md verificados y actualizados

---

## 🔧 Validation Scripts / Scripts de Validación

### English
```bash
# Check wiki-links validity
./scripts/validate-links.sh

# Count tests vs documented counts
./scripts/count-tests.sh

# Validate vault structure
./scripts/check-structure.sh

# Comprehensive quarterly audit
./scripts/quarterly-audit.sh
```

### Español
```bash
# Validar wiki-links
./scripts/validate-links.sh

# Contar tests vs documentados
./scripts/count-tests.sh

# Validar estructura del vault
./scripts/check-structure.sh

# Auditoría trimestral comprehensiva
./scripts/quarterly-audit.sh
```

---

## 🎯 Use Cases / Casos de Uso

### English
**For Development Projects:**
- [[Start Here]] → [[Proyecto - TODOs]] → [[Implementation Progress]]
- [[Architecture Decisions]] → [[Testing Strategy]] → [[API Documentation]]
- [[Bug Tracker]] for issue tracking

**For Research Projects:**
- [[Start Here]] → [[Proyecto - TODOs]] → [[Research Progress]]
- Literature reviews, methodology documentation
- Experiment tracking and findings

**For Data Projects:**
- [[Start Here]] → [[Proyecto - TODOs]] → [[Implementation Progress]]
- Dataset documentation and analysis pipelines
- Model registry and visualization guides

### Español
**Para Proyectos de Desarrollo:**
- [[Start Here]] → [[Proyecto - TODOs]] → [[Implementation Progress]]
- [[Architecture Decisions]] → [[Testing Strategy]] → [[API Documentation]]
- [[Bug Tracker]] para seguimiento de issues

**Para Proyectos de Investigación:**
- [[Start Here]] → [[Proyecto - TODOs]] → [[Research Progress]]
- Revisiones de literatura, documentación de metodología
- Seguimiento de experimentos y hallazgos

**Para Proyectos de Datos:**
- [[Start Here]] → [[Proyecto - TODOs]] → [[Implementation Progress]]
- Documentación de datasets y pipelines de análisis
- Registro de modelos y guías de visualización

---

## 💻 IDE Setup / Configuración de IDE

### English
| IDE | Configuration |
|-----|---------------|
| **Claude Code** | Create `CLAUDE.md` in code repo pointing to vault |
| **GitHub Copilot** | Create `.github/copilot-instructions.md` with vault location |
| **OpenCode** | Create `.opencode/instructions.md` with vault references |
| **Kimi CLI** | Install `obsidian-vault-querier` skill and configure path |

### Español
| IDE | Configuración |
|-----|---------------|
| **Claude Code** | Crear `CLAUDE.md` en repo de código apuntando al vault |
| **GitHub Copilot** | Crear `.github/copilot-instructions.md` con ubicación del vault |
| **OpenCode** | Crear `.opencode/instructions.md` con referencias al vault |
| **Kimi CLI** | Instalar skill `obsidian-vault-querier` y configurar ruta |

---

## 🎨 Customization / Personalización

### English
See detailed customization guide in your chosen language folder:
- `en/SETUP_GUIDE.md` - Full setup and customization guide
- `es/SETUP_GUIDE.md` - Guía completa de configuración y personalización

Key customizations:
- Update PROJECT_NAME throughout all files
- Configure git remote for your project
- Adjust category prefixes in Topics/
- Customize color tags in AGENTS.md

### Español
Ver guía detallada de personalización en tu carpeta de idioma:
- `en/SETUP_GUIDE.md` - Guía completa de configuración y personalización
- `es/SETUP_GUIDE.md` - Guía completa de configuración y personalización

Personalizaciones clave:
- Actualizar PROJECT_NAME en todos los archivos
- Configurar remoto de git para tu proyecto
- Ajustar prefijos de categoría en Topics/
- Personalizar etiquetas de color en AGENTS.md

---

## 📝 Available Skills / Skills Disponibles

### English
Located in `.claude/skills/`:
- `vault-reader` - Consult vault state, TODOs, architecture
- `vault-writer` - Create/modify documentation (ADRs, Topics, MOCs)
- `vault-daily` - Create daily session logs
- `vault-commit` - Commit vault changes after modifications

### Español
Ubicados en `.claude/skills/`:
- `vault-reader` - Consultar estado del vault, TODOs, arquitectura
- `vault-writer` - Crear/modificar documentación (ADRs, Topics, MOCs)
- `vault-daily` - Crear registros de sesión diarios
- `vault-commit` - Commitear cambios del vault después de modificaciones

---

## 🤝 Repo ↔ Vault Sync / Sincronización Repo ↔ Vault

### English
**Always update vault when:**
- ✅ Completing features
- ✅ Making architectural decisions
- ✅ Fixing critical bugs
- ✅ Reaching milestones
- ✅ Adding/modifying tests

See [[Sync Checklist]] template for details.

### Español
**Siempre actualizar el vault cuando:**
- ✅ Se completan features
- ✅ Se toman decisiones arquitectónicas
- ✅ Se corrigen bugs críticos
- ✅ Se alcanzan milestones
- ✅ Se agregan/modifican tests

Ver plantilla [[Sync Checklist]] para detalles.

---

## 📚 Documentation / Documentación

### English
| Document | Location |
|----------|----------|
| **AGENTS.md** | `en/AGENTS.md` |
| **CLAUDE.md** | `en/CLAUDE.md` |
| **Setup Guide** | `en/SETUP_GUIDE.md` |
| **Lessons Learned** | `.claude/tasks/lessons/` |
| **Templates** | `Templates/` |

### Español
| Documento | Ubicación |
|-----------|-----------|
| **AGENTS.md** | `es/AGENTS.md` |
| **CLAUDE.md** | `es/CLAUDE.md` |
| **Guía de Configuración** | `es/SETUP_GUIDE.md` |
| **Lecciones Aprendidas** | `.claude/tasks/lessons/` |
| **Plantillas** | `Templates/` |

---

## 📄 License / Licencia

MIT License - See [LICENSE](./LICENSE) for details.

Licencia MIT - Ver [LICENSE](./LICENSE) para detalles.

---

**Created by:** Lucy + Claude Code + Kimi CLI + OpenCode  
**Version:** 1.0.0  
**Date:** 2026-03-08  
**License:** MIT
