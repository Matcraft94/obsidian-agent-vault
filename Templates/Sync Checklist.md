---
tags: [checklist, sync]
created: {{date:YYYY-MM-DD}}
project: {{PROJECT_NAME}}
---

# Sync Checklist: {{feature/change}}

**Fecha:** {{date:YYYY-MM-DD}}  
**Feature:** [Nombre de la feature/change]  
**Tipo:** [feature|bugfix|refactor|docs]

---

## Pre-Implementation

- [ ] Leer vault (topics relevantes)
- [ ] Revisar [[Proyecto - TODOs]]
- [ ] Verificar [[Architecture Decisions]]
- [ ] Plan mode activado (si aplica)

---

## Durante Implementación

- [ ] Tests pasando localmente
- [ ] Linting/formatting OK
- [ ] Documentación de código actualizada
- [ ] Daily Note actualizado

---

## Post-Implementation (Repo → Vault)

### Daily Notes
- [ ] Crear/actualizar índice `YYYY-MM-DD.md`
- [ ] Detalle creado si es necesario (`YYYY-MM-DD - Feature.md`)
- [ ] Links a topics/MOCs afectados

### Topics (si nuevo concepto)
- [ ] Crear en `Topics/` con prefijo categórico
- [ ] Frontmatter con tags correctos
- [ ] Links a 2-3+ topics existentes
- [ ] Extreme brevity (1-2 líneas/sección)

### ADRs (si decisión arquitectónica)
- [ ] Crear en `ADRs/`
- [ ] Nomenclatura: `ADR-XXX Descripcion.md`
- [ ] Status: proposed → accepted
- [ ] Consecuencias documentadas (+/-)

### MOCs
- [ ] [[Implementation Progress]] actualizado
- [ ] [[Proyecto - TODOs]] actualizado
- [ ] [[Architecture Decisions]] (si aplica)
- [ ] [[Testing Strategy]] (si cambios en tests)
- [ ] [[API Documentation]] (si nuevos endpoints)
- [ ] [[Bug Tracker]] (si bug fix)

---

## Commit

### Repo Commit
```
feat[area]: description

- Cambio 1
- Cambio 2
```

### Vault Commit (si vault es repo separado)
```
daily: Session log YYYY-MM-DD

- Completed [feature]
- Updated [MOCs]
```

---

## Verification

- [ ] Repo: Tests pasan CI/CD
- [ ] Repo: Code review aprobado
- [ ] Vault: Documentación completa
- [ ] Vault: Links funcionan (verificar en graph)
- [ ] Sync: Commit message referencia vault si aplica

---

## Eventos Sync Comunes

| Evento Repo | Actualización Vault |
|-------------|---------------------|
| Nueva fase completada | [[Implementation Progress]] + Daily Note |
| Tests pasan | Actualizar test counts |
| Decisión arquitectónica | Nuevo ADR + [[Architecture Decisions]] |
| Bug crítico fixeado | Daily Note + [[Bug Tracker]] |
| Nuevo endpoint | [[API Documentation]] + Topic si aplica |
| Refactor importante | Topic [[Refactor X]] + Daily Note |

---

## Links

- [[Proyecto - TODOs]]
- [[Implementation Progress]]
- [[Architecture Decisions]]
- [[Daily Notes/{{date:YYYY-MM-DD}}]]

---

#checklist #sync #workflow
