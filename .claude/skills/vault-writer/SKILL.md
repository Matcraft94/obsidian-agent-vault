---
title: Vault Writer
description: Crea y modifica documentación en el vault siguiendo convenciones estrictas
triggers:
  - crear documentación
  - modificar vault
  - agregar ADR
  - crear topic
  - actualizar MOC
  - documentar decisión
  - agregar nota
  - crear tema
  - "document that"
  - "add to vault"
  - "create ADR"
  - "update documentation"
  - "write about"
  - "record decision"
  - "add topic"
category: documentation
---

# Vault Writer Skill

## Propósito

Crear y modificar documentación en el vault siguiendo **convenciones estrictas** que garantizan consistencia, navegabilidad y mantenibilidad.

## Triggers de Activación (15+)

### Creación
1. "crear documentación"
2. "agregar ADR"
3. "crear topic"
4. "nueva nota"
5. "documentar decisión"
6. "create documentation"
7. "add ADR"
8. "create topic"

### Modificación
9. "modificar vault"
10. "actualizar MOC"
11. "actualizar documentación"
12. "update docs"
13. "update vault"

### Contenido
14. "escribir sobre X"
15. "documentar Y"
16. "write about"
17. "record that"
18. "add note about"

## Convenciones Estrictas

### 1. Topics/ es FLAT (Sin Subfolders)

```
Topics/
├── Arquitectura - Clean Architecture.md      ✓
├── Arquitectura - Hexagonal.md               ✓
├── BD - PostgreSQL.md                        ✓
├── Testing - E2E Suite.md                    ✓
├── Testing/
│   └── Unit Tests.md                         ✗ NUNCA
```

**REGLA**: Nunca crear subcarpetas en Topics/. Todos los archivos van en la raíz.

### 2. Prefijos Categóricos Obligatorios

| Categoría | Uso | Ejemplo |
|-----------|-----|---------|
| `Arquitectura` | Patrones, estilos arquitectónicos | `Arquitectura - Clean Architecture.md` |
| `BD` | Base de datos, modelos | `BD - PostgreSQL.md` |
| `Testing` | Tests, estrategias | `Testing - E2E Suite.md` |
| `Seguridad` | RLS, autenticación | `Seguridad - JWT Authentication.md` |
| `API` | Endpoints, documentación | `API - OpenAPI.md` |
| `Frontend` | Vue, React, UI | `Frontend - Vue.js.md` |
| `Backend` | Django, servicios | `Backend - Domain Services.md` |
| `Negocio` | Lógica de negocio | `Negocio - Evaluación Docente.md` |
| `DevOps` | Docker, CI/CD | `DevOps - Docker.md` |
| `Proyecto` | Roadmap, TODOs | `Proyecto - Roadmap.md` |
| `Doc` | Documentación, guías | `Doc - Developer Onboarding.md` |
| `Herramienta` | Git, IDEs | `Herramienta - Git Workflow.md` |

### 3. Frontmatter Requerido

```yaml
---
title: "Arquitectura - Clean Architecture"
description: "Principios y aplicación de Clean Architecture en el proyecto"
created: 2026-03-08
modified: 2026-03-08
tags:
  - topic
  - technical
  - architecture
---
```

**Campos obligatorios**:
- `title`: Título del archivo (sin prefijo)
- `description`: Descripción de 1 línea
- `created`: Fecha de creación (YYYY-MM-DD)
- `modified`: Fecha de última modificación
- `tags`: Array de tags (mínimo 3)

### 4. Extreme Brevity (1-2 líneas por sección)

```markdown
## Clean Architecture

Separación de concerns en capas concéntricas. Domain en el centro, sin dependencias externas.

### Capas

- **Domain**: Lógica pura, zero frameworks
- **Application**: Casos de uso, orquesta domain
- **Infrastructure**: DB, APIs, frameworks
- **Presentation**: UI, controllers

### Reglas

- Las dependencias apuntan hacia adentro
- Domain no conoce nada externo
- Interfaces definen contratos
```

**REGLA**: Cada bullet debe ser 1 línea. Máximo 2 líneas por concepto.

### 5. Wiki-links Obligatorios

```markdown
## Relacionados

- [[Arquitectura - Hexagonal]] - Alternativa considerada
- [[ADR-001 PostgreSQL vs MongoDB]] - Decisión de BD
- [[Backend - Domain Services]] - Implementación
```

**REGLA**: Todo archivo nuevo debe tener una sección "Relacionados" con al menos 2 wiki-links.

## Sistema de Tags (3 Niveles)

### Tier 1 - Estructural
| Tag | Color | Uso |
|-----|-------|-----|
| `daily` | Cyan | Daily notes |
| `moc` | Magenta | Maps of Content |

### Tier 2 - Categorías
| Tag | Color | Uso |
|-----|-------|-----|
| `technical` | Lime | Conceptos técnicos |
| `business` | Gold | Lógica de negocio |
| `tools` | Orange | Frameworks/libs |

### Tier 3 - Especificidad
| Tag | Color | Uso |
|-----|-------|-----|
| `architecture` | Electric blue | Arquitecturas |
| `database` | Bright green | BD/PostgreSQL |
| `frontend` | Purple | Frontend/UI |
| `backend` | Yellow | Backend/API |
| `testing` | Hot pink | Testing |
| `implementation` | Violet | Implementación |

**Auto-tagging por tipo**:
- Topics de arquitectura → `[topic, technical, architecture]`
- Topics de BD → `[topic, technical, database]`
- Topics de frontend → `[topic, technical, frontend]`
- Topics de backend → `[topic, technical, backend]`

## Plantillas

### Topic Template

```markdown
---
title: "Categoria - Nombre del Tema"
description: "Breve descripción del tema"
created: YYYY-MM-DD
modified: YYYY-MM-DD
tags:
  - topic
  - category
  - specific-tag
---

# Categoria - Nombre del Tema

## Concepto Principal

1-2 líneas explicando el concepto central.

### Subtema 1

- Bullet 1: descripción corta
- Bullet 2: descripción corta
- Bullet 3: descripción corta

### Subtema 2

- Bullet 1: descripción corta
- Bullet 2: descripción corta

## Ejemplos

```python
# Código de ejemplo (si aplica)
codigo_aqui()
```

## Relacionados

- [[Otro Topic]] - Descripción de relación
- [[ADR-XXX Decision]] - Decisión relacionada
```

### ADR Template

```markdown
---
title: "ADR-XXX: Título de la Decisión"
description: "Decisión sobre X en favor de Y"
created: YYYY-MM-DD
modified: YYYY-MM-DD
tags:
  - adr
  - technical
  - architecture
status: accepted
---

# ADR-XXX: Título de la Decisión

## Contexto

Problema que motivó la decisión. 2-3 líneas máximo.

## Decisión

Decisión tomada. 1-2 líneas claras.

## Consecuencias

### Positivas (+)

- Beneficio 1
- Beneficio 2
- Beneficio 3

### Negativas (-)

- Costo/riesgo 1
- Costo/riesgo 2

## Alternativas Consideradas

| Alternativa | Pros | Contras |
|-------------|------|---------|
| Opción A | ... | ... |
| Opción B | ... | ... |

## Relacionados

- [[Topic relacionado]]
- [[ADR-YYY Otra decisión]]
```

## Puntos de Sincronización con Código

Cuando se modifica el vault, verificar:

1. **Modelos** → Actualizar Topics de BD si cambia schema
2. **APIs** → Actualizar Topics de API si cambian endpoints
3. **Tests** → Actualizar Topics de Testing si cambia estrategia
4. **Decisiones** → Crear ADR para decisiones arquitectónicas
5. **Bugs** → Crear Topic de Bug si es un problema conocido

## Post-Escritura Obligatoria

**SIEMPRE commitear después de modificar el vault.**

Usar skill `vault-commit` después de cada modificación.

## Qué NO Hacer

| ❌ Prohibido | ✅ Correcto |
|-------------|-------------|
| Crear subfolders en Topics/ | Mantener Topics/ plano |
| Omitir prefijos categóricos | Usar `Categoria - Nombre.md` |
| Sin frontmatter | Siempre incluir frontmatter completo |
| Párrafos extensos | Bullets de 1-2 líneas |
| Sin wiki-links | Mínimo 2 links en sección Relacionados |
| Mezclar idiomas | Todo en español (salvo términos técnicos) |
| Modificar sin commitear | Commitear SIEMPRE después |
