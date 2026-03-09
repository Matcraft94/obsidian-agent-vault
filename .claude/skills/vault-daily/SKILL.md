---
title: Vault Daily
description: Crea Daily Notes de sesión siguiendo el formato de índice + detalle con extreme brevity
triggers:
  - crear daily note
  - iniciar sesión
  - empezar día
  - daily log
  - registro diario
  - crear nota diaria
  - session log
  - "start session"
  - "begin day"
  - "create daily"
  - "log today"
category: documentation
---

# Vault Daily Skill

## Propósito

Crear Daily Notes que documenten sesiones de trabajo de forma estructurada, breve y navegable.

## Estructura de Daily Notes

Cada día tiene **DOS archivos**:

```
Daily Notes/
├── 2026-03-08.md                          ← ÍNDICE (obligatorio)
└── 2026-03-08 - Implementación RLS.md     ← DETALLE (opcional)
```

### Archivo de Índice (Obligatorio)
- **Nombre**: `YYYY-MM-DD.md`
- **Propósito**: Resumen del día, temas trabajados, logros, pendientes
- **Formato**: Bullets, wiki-links, extreme brevity

### Archivo de Detalle (Opcional)
- **Nombre**: `YYYY-MM-DD - Descripción.md`
- **Propósito**: Detalles extensos de un tema específico
- **Cuándo crear**: Cuando hay contenido sustancial (>5 bullets en un tema)

## Triggers de Activación (10+)

### Inicio de Sesión
1. "crear daily note"
2. "iniciar sesión"
3. "empezar día"
4. "start session"
5. "begin day"

### Durante la Sesión
6. "daily log"
7. "registro diario"
8. "log today"
9. "actualizar daily"
10. "add to daily"

### Cierre de Sesión
11. "terminar sesión"
12. "cerrar día"
13. "end session"
14. "wrap up"

## Formato del Índice

```markdown
---
title: "Daily Note - 2026-03-08"
description: "Sesión de trabajo - Implementación RLS"
date: 2026-03-08
tags:
  - daily
  - session
---

# 2026-03-08

## Session Focus

Implementación de Row Level Security en modelos core.

## Completed

- [[2026-03-08 - Implementación RLS]] - Configuración inicial
- Modelos actualizados con `institution` FK
- Tests RLS creados y pasando

## In Progress

- [[Paso 3.2 - Value Objects]] - 50% completado
- Revisión de ADR-002

## Blockers

- Ninguno

## Commits

- `feat[rls]: add RLS policies to core models`
- `test[rls]: add multi-tenant isolation tests`

## Next Steps

- Finalizar Value Objects
- Iniciar Domain Services

## Links

- [[2026-03-07]] ← Día anterior
- [[Proyecto - TODOs]]
- [[Fase 3 - Domain y Services]]
```

## Formato del Detalle

```markdown
---
title: "2026-03-08 - Implementación RLS"
description: "Detalles de la implementación de Row Level Security"
date: 2026-03-08
tags:
  - daily
  - technical
  - database
---

# 2026-03-08 - Implementación RLS

## Objetivo

Implementar RLS en todos los modelos del módulo evaluations.

## Tareas Realizadas

- Agregada FK `institution` a `BaseModel`
- Creado `TenantManager` con filtrado automático
- Implementadas policies en PostgreSQL
- Creados tests con contextos de tenant

## Problemas Encontrados

- Conflicto con auth: `TenantJWTAuthentication` necesita bypass
- Solución: Usar `superuser_context()` para lookups de usuario

## Decisiones

- Usar `django-rls` en lugar de raw SQL
- Cada test corre en contexto de superuser por default

## Código Relevante

```python
# TenantManager
class TenantManager(models.Manager):
    def get_queryset(self):
        qs = super().get_queryset()
        if rls_enabled():
            return qs.filter(institution_id=current_tenant())
        return qs
```

## Relacionados

- [[BD - RLS Policies]]
- [[ADR-001 PostgreSQL vs MongoDB]]
- [[Testing - RLS Tests]]
```

## Extreme Brevity Guidelines

### ✅ HACER
- 1-2 líneas por bullet
- Wiki-links para detalles
- Fechas ISO (YYYY-MM-DD)
- Tags consistentes

### ❌ NO HACER
- Párrafos extensos en índice
- Redundancia entre índice y detalle
- Olvidar enlace al día anterior
- Mezclar múltiples temas sin separar

## Ejemplos de Brevidad

**❌ Mal:**
```markdown
- Hoy trabajé en la implementación de Row Level Security que es muy importante para el proyecto porque nos permite tener multi-tenancy de forma segura y eficiente
```

**✅ Bien:**
```markdown
- [[2026-03-08 - Implementación RLS]] - RLS inicial configurado
```

## Protocolo de Cierre de Sesión

Antes de terminar:

1. **Verificar** que el índice está actualizado
2. **Agregar** commits realizados
3. **Actualizar** Next Steps
4. **Crear** archivo de detalle si es necesario
5. **Commitear** cambios del vault

## Tag `daily` Obligatorio

Todos los archivos Daily Notes deben tener el tag `daily`:

```yaml
tags:
  - daily
  - session      # o technical, etc.
```

## Enlace al Día Anterior

Siempre incluir enlace al día anterior al final:

```markdown
## Links

- [[2026-03-07]] ← Día anterior
```

## Cuándo Crear Detalle

Crear archivo de detalle cuando:
- Un tema ocupa más de 5 bullets en el índice
- Hay código relevante que documentar
- Hay decisiones importantes que registrar
- Hay problemas/soluciones que vale la pena recordar

## Plantilla Rápida

```markdown
---
title: "Daily Note - YYYY-MM-DD"
description: "Sesión de trabajo"
date: YYYY-MM-DD
tags:
  - daily
---

# YYYY-MM-DD

## Session Focus

[Tema principal de hoy]

## Completed

- [ ] 
- [ ] 

## In Progress

- [ ] 

## Blockers

- [Ninguno / descríbelos]

## Commits

- ``

## Next Steps

- [ ] 

## Links

- [[YYYY-MM-DD]] ← Día anterior
```
