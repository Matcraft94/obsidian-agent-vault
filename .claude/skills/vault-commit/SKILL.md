---
title: Vault Commit
description: Commitea cambios del vault después de CADA modificación
triggers:
  - commitear vault
  - git commit vault
  - guardar vault
  - save vault
  - commit changes
  - "commit vault"
  - "guardar cambios vault"
  - "save obsidian"
  - "commit docs"
  - "commit notes"
category: documentation
---

# Vault Commit Skill

## Propósito

Commitear cambios del vault de documentación de forma consistente y separada del código fuente.

## ⚠️ CRÍTICO: Vault es Repositorio SEPARADO

```
📁 /home/lucy/Documents/GitHub/PROJECT_CODE/     ← Repositorio de código
📁 /home/lucy/Documents/knowledge-bases/VAULT/   ← Repositorio del vault (SEPARADO)
```

**NUNCA** mezclar commits del vault con commits del código.

## Triggers de Activación (10+)

### Después de Modificaciones
1. "commitear vault"
2. "guardar vault"
3. "save vault"
4. "commit vault"
5. "guardar cambios vault"

### Documentación
6. "commit docs"
7. "commit notes"
8. "commit documentation"
9. "save obsidian"
10. "guardar obsidian"

### Explícito
11. "commit changes to vault"
12. "push vault changes"

## Flujo de Commit

```bash
# 1. Verificar status
cd /path/to/vault
git status

# 2. Agregar cambios
git add .

# 3. Crear commit con prefijo apropiado
git commit -m "prefix: descripción del cambio"

# 4. (Opcional) Push
git push
```

## 8 Prefijos de Commit

| Prefijo | Uso | Ejemplo |
|---------|-----|---------|
| `progress` | Avance en fase/implementación | `progress: Fase 3 - 75% completado` |
| `todo` | Actualización de TODOs | `todo: 3 tareas completadas esta semana` |
| `adr` | Nueva/modificación de ADR | `adr: add ADR-003 Cache Strategy` |
| `docs` | Documentación general | `docs: update API documentation` |
| `daily` | Daily Note nuevo/actualizado | `daily: Session log 2026-03-08` |
| `moc` | Map of Content nuevo/actualizado | `moc: update Fase 3 progress` |
| `sync` | Sincronización con código | `sync: align models with vault docs` |
| `refactor` | Reorganización de vault | `refactor: reorganize Topics structure` |

## Convenciones de Mensajes

### ✅ HACER
- Usar prefijos en minúsculas
- Mensaje descriptivo pero conciso
- Imperativo presente (Add, Update, not Added)
- Sin punto final

### ❌ NO HACER
- Mezclar con mensajes de código
- Mensajes vagos ("update", "fix")
- Co-Authored-By en vault
- Commits vacíos ("WIP", "temp")

## Ejemplos por Tipo

### Progress
```bash
git commit -m "progress: Fase 3 - completado Value Objects"
git commit -m "progress: 50% ADR-003 redactado"
```

### TODO
```bash
git commit -m "todo: 5 tareas marcadas como completadas"
git commit -m "todo: agregadas 3 tareas para próxima semana"
```

### ADR
```bash
git commit -m "adr: add ADR-004 Authentication Strategy"
git commit -m "adr: update ADR-002 con consecuencias adicionales"
```

### Docs
```bash
git commit -m "docs: update Clean Architecture guidelines"
git commit -m "docs: add examples to RLS Policies topic"
```

### Daily
```bash
git commit -m "daily: Session log 2026-03-08"
git commit -m "daily: Detalle de implementación RLS"
```

### MOC
```bash
git commit -m "moc: update Fase 3 - Domain y Services"
git commit -m "moc: nuevo MOC para Fase 4"
```

### Sync
```bash
git commit -m "sync: alinear modelos con documentación BD"
git commit -m "sync: actualizar API docs con endpoints nuevos"
```

### Refactor
```bash
git commit -m "refactor: reorganizar Topics por categoría"
git commit -m "refactor: renombrar ADRs con formato consistente"
```

## Post-Commit Verification

Después de commitear, verificar:

```bash
# Verificar commit creado
git log -1 --oneline

# Verificar que no hay archivos sin trackear
git status

# Verificar rama correcta
git branch --show-current
```

## Qué NO Hacer

| ❌ Prohibido | ✅ Correcto |
|-------------|-------------|
| Mezclar commits vault + código | Commits separados en repos separados |
| Skip commits (olvidar commitear) | Commitear SIEMPRE después de modificar |
| Usar Co-Authored-By en vault | Mensaje simple sin metadatos |
| Commits vacíos o "WIP" | Mensajes descriptivos con prefijo |
| Commits largos con muchos cambios | Commits atómicos (un tema por commit) |

## Workflow Completo

### 1. Modificar Vault
```bash
# Editar archivo
vim Topics/BD	e - PostgreSQL.md
```

### 2. Verificar Cambios
```bash
git status
git diff
```

### 3. Stage y Commit
```bash
git add Topics/BD - PostgreSQL.md
git commit -m "docs: update PostgreSQL guidelines with indexing"
```

### 4. Verificar
```bash
git log -1 --oneline
# docs: update PostgreSQL guidelines with indexing
```

## Integración con Otros Skills

Este skill se usa **SIEMPRE** después de:
- `vault-writer` - Crear/modificar documentación
- `vault-daily` - Crear Daily Note
- Cualquier modificación manual al vault

## Recordatorio Automático

**REGLA DE ORO**: Después de CADA modificación al vault:

1. ✅ Guardar archivo
2. ✅ Usar `vault-commit`
3. ✅ Verificar commit creado

## Scripts Útiles

### Commit Rápido
```bash
# Alias sugerido en ~/.bashrc
alias vaultcommit='cd /path/to/vault && git add . && git commit -m'

# Uso:
vaultcommit "daily: Session log $(date +%Y-%m-%d)"
```

### Status del Vault
```bash
# Alias sugerido
alias vaultstatus='cd /path/to/vault && git status'
```

## Checklist Pre-Commit

- [ ] Archivos modificados guardados
- [ ] Frontmatter completo (si aplica)
- [ ] Wiki-links validados
- [ ] Prefijo de commit seleccionado
- [ ] Mensaje descriptivo escrito
- [ ] Repo correcto (vault, no código)
