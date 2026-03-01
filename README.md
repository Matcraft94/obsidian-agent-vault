# TEMPLATE_CODE - Obsidian Vault Template

Plantilla de Obsidian Vault optimizada para proyectos de código e investigación con soporte multi-agente (Claude Code, Copilot, OpenCode, Kimi).

## 🚀 Quick Start

1. **Copia este vault** a tu ubicación deseada
2. **Renombra** el proyecto en `AGENTS.md` y `CLAUDE.md`
3. **Configura tu IDE** (ver sección IDE Setup)
4. **Empieza a usar** los templates y la estructura

## 📁 Estructura

```
vault/
├── README.md              ← Este archivo
├── AGENTS.md              ← Guía para LLMs/Agentes
├── CLAUDE.md              ← Guía específica del proyecto
├── PLAN.md                ← Plan de implementación (opcional)
├── Daily Notes/           ← Registro diario (YYYY-MM-DD.md)
├── Topics/                ← Notas atómicas (FLAT)
├── MOCs/                  ← Maps of Content (hubs)
├── ADRs/                  ← Architecture Decision Records
└── Templates/             ← Plantillas de notas
```

## 🎯 Para Proyectos de Desarrollo

### Configuración
1. Actualiza `AGENTS.md`:
   - Nombre del proyecto
   - Stack tecnológico (Django, React, etc.)
   - Arquitectura (Clean, Hexagonal, etc.)
   - Location del repo

2. Actualiza `CLAUDE.md`:
   - Overview del proyecto
   - Comandos específicos (tests, lint, build)
   - Estructura de carpetas del código
   - Convenciones del equipo

3. Usa estos templates:
   - `Templates/ADR.md` - Decisiones arquitectónicas
   - `Templates/Bug Fix.md` - Corrección de bugs
   - `Templates/Refactor.md` - Refactorings
   - `Templates/Topic.md` - Notas técnicas
   - `Templates/Daily Note.md` - Registro diario

### MOCs Recomendados
- `MOCs/Start Here.md` - Punto de entrada
- `MOCs/Implementation Progress.md` - Estado del proyecto
- `MOCs/Architecture Decisions.md` - Decisiones técnicas
- `MOCs/Testing Strategy.md` - Estrategia de testing
- `MOCs/API Documentation.md` - Documentación de API
- `MOCs/Security & Privacy.md` - Seguridad
- `MOCs/Deployment & DevOps.md` - Infraestructura

## 🔬 Para Proyectos de Investigación

### Configuración
1. Actualiza `AGENTS.md`:
   - Área de investigación
   - Metodología
   - Fuentes principales
   - Location de datos/papers

2. Actualiza `CLAUDE.md`:
   - Pregunta de investigación
   - Estado del arte
   - Metodología detallada
   - Experimentos/análisis planeados

3. Usa estos templates:
   - `Templates/research.md` - Notas de investigación
   - `Templates/resource.md` - Recursos bibliográficos
   - `Templates/brainstorm.md` - Sesiones de brainstorming
   - `Templates/Topic.md` - Conceptos/ideas
   - `Templates/Daily Note.md` - Registro diario

### MOCs Recomendados
- `MOCs/Start Here.md` - Punto de entrada
- `MOCs/Research Progress.md` - Estado de la investigación
- `MOCs/Literature Review.md` - Revisión bibliográfica
- `MOCs/Methodology.md` - Metodología
- `MOCs/Experiments.md` - Experimentos/Análisis
- `MOCs/Findings.md` - Hallazgos
- `MOCs/Publications.md` - Publicaciones planificadas

## 💻 IDE Setup

### Claude Code
El archivo `AGENTS.md` en la raíz del repo debe apuntar a este vault:

```markdown
## Obsidian Vault
**Location:** `D:\WSL-Projects\MiProyecto\vault`

ALWAYS update the vault when making decisions...
```

### GitHub Copilot
Crea `.github/copilot-instructions.md`:

```markdown
# Copilot Instructions

## Knowledge Base
This project uses an Obsidian vault at: `D:\WSL-Projects\MiProyecto\vault`

## When generating code:
1. Check vault for architectural decisions
2. Follow patterns documented in MOCs
3. Update vault when adding new features
```

### OpenCode
Crea `.opencode/instructions.md`:

```markdown
# OpenCode Instructions

## Project Knowledge
- Vault location: `D:\WSL-Projects\MiProyecto\vault`
- Read `AGENTS.md` for vault structure
- Read `CLAUDE.md` for project specifics

## Workflow
1. Check vault before implementing features
2. Update Daily Notes after sessions
3. Create ADRs for architectural decisions
```

### Kimi CLI
El skill `obsidian-vault-querier` debe estar en:
`C:\Users\[user]\.config\agents\skills\obsidian-vault-querier\`

Edita el skill para apuntar a tu vault location.

## 🎨 Personalización

### 1. Colores (Cyberpunk System)
Edita `.obsidian/graph.json` para colores de nodos:
- Cyan: Daily notes
- Magenta: MOCs
- Lime: Technical topics
- Gold: Business topics
- Electric Blue: Architecture
- Bright Green: Database
- Amber: Evaluation/Research

### 2. Templates
Modifica los templates en `Templates/` según tus necesidades:
- Añade/quita secciones
- Cambia el frontmatter
- Adapta el estilo de tu equipo

### 3. Estructura
Mantén `Topics/` FLAT (sin subfolders). Usa MOCs para organizar.

## 📝 Convenciones

### Nomenclatura
- Daily Notes: `YYYY-MM-DD.md`
- Topics: `Nombre Concepto.md` (Title Case)
- MOCs: `Nombre Descriptivo.md`
- ADRs: `ADR-XXX Descripcion Breve.md`

### Links
- Usa `[[wiki links]]` para TODO concepto
- Años: `[[2026]]`, `[[2025]]`
- Conecta Daily Notes → Topics → MOCs

### Tags
```yaml
# Topics
tags: [topic, technical, architecture]

# Daily Notes  
tags: [daily]

# MOCs
tags: [moc, index]

# ADRs
tags: [adr, technical]
```

## 🔍 Búsqueda

### PowerShell/Grep
```powershell
# Buscar en Topics
Get-ChildItem Topics\ -Filter "*.md" | Select-String "pattern"

# Buscar en todo el vault
Get-ChildItem -Recurse -Filter "*.md" | Select-String "pattern"

# Listar MOCs
Get-ChildItem MOCs\ -Filter "*.md"
```

### Obsidian Search
- `Ctrl+Shift+F` - Search en vault
- `Ctrl+O` - Quick switcher
- `Ctrl+P` - Command palette

## 🤝 Integración Repo ↔ Vault

### Pre-commit Checklist
- [ ] Tests pass
- [ ] Code review ready
- [ ] Vault updated:
  - [ ] Daily Note created/updated
  - [ ] Topics created/updated
  - [ ] MOCs updated (Implementation/Research Progress)
- [ ] ADRs created for new decisions

### Sync Points
| Evento | Repo | Vault |
|--------|------|-------|
| Feature complete | Commit | Daily Note + Topics |
| Architecture decision | PR | ADR |
| Bug fixed | Commit | Bug Fix topic |
| Milestone reached | Tag | MOC Progress update |

## 📚 Recursos

- [Obsidian Help](https://help.obsidian.md/)
- [Zettelkasten Method](https://zettelkasten.de/)
- [PARA Method](https://fortelabs.com/blog/para/)

---

**Plantilla creada por:** Claude Code (Kimi CLI)  
**Versión:** 1.0  
**Fecha:** 2026-02-12
