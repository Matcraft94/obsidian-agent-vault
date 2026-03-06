---
tags: [moc, index, workflow]
created: 2026-03-05
updated: 2026-03-05
---

# Agent Workflow & Lessons

Sistema de trabajo y aprendizaje continuo para agentes AI en [[PROJECT_NAME]].

## 🎯 AI Agent Operating Guidelines

### Workflow Orchestration

1. **Plan Mode First** — Plan mode para tareas no triviales (3+ pasos)
2. **Subagent Strategy** — Delegar investigación y análisis paralelo
3. **Self-Improvement Loop** — Documentar correcciones en lessons
4. **Verification Before Done** — Probar antes de marcar completo
5. **Demand Elegance** — Buscar soluciones elegantes
6. **Autonomous Bug Fixing** — Resolver bugs sin hand-holding

### Task Management

⚠️ **TODOs viven en el Vault** (fuente de verdad)

Usar skills:
- `[PROJECT]-vault-reader` — Consultar estado
- `[PROJECT]-vault-writer` — Crear documentación
- `[PROJECT]-vault-daily` — Daily notes
- `[PROJECT]-vault-commit` — Commitear cambios

## 📚 Lessons System

Sistema de aprendizaje continuo organizado por temas.

### Estructura

En `.claude/tasks/lessons/` (si se usa Claude Code):
- `index.md` — Navegación maestra
- `architecture.md` — Arquitectura y patrones
- `testing.md` — Testing y calidad
- `vault.md` — Convenciones del vault
- `domain.md` — Lógica de dominio
- `api.md` — APIs y DRF
- `frontend.md` — Vue/React
- `workflow.md` — Procesos de trabajo
- `general.md` — General

### Formato de Lesson

```markdown
### YYYY-MM-DD - Título

**Contexto:** Situación
**Error:** Qué salió mal
**Corrección:** Cómo se arregló
**Regla:** Nunca/Siempre...
**Tags:** #lesson #tag
```

### Reglas

- **Máximo:** 30 lecciones por archivo
- **Pruning:** Archivar las 10 más antiguas cuando se excede
- **Revisión:** Mensual, eliminar obsoletas

## 🔄 Sync Workflow

### Checklist Pre-Commit

- [ ] Tests pasan
- [ ] Vault actualizado:
  - [ ] Daily Note
  - [ ] Topics (si nuevo concepto)
  - [ ] MOCs relevantes
- [ ] ADRs creados (si aplica)

### Eventos Sync

| Repo | Vault |
|------|-------|
| Fase completada | [[Implementation Progress]] + Daily |
| Tests pasan | Actualizar métricas |
| Decisión técnica | ADR + [[Architecture Decisions]] |
| Bug fixeado | [[Bug Tracker]] + Daily |

Usar template [[Sync Checklist]] para sesiones complejas.

## 🔗 Links

- [[AGENTS.md]] - Guía completa para agentes
- [[CLAUDE.md]] - Especificaciones del proyecto
- [[Proyecto - TODOs]]
- [[Implementation Progress]]
- [[Setup Guide]]

---

*Este MOC documenta el sistema de trabajo del agente*
