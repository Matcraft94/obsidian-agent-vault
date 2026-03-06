# AGENTS.md (Vault)

Instrucciones para LLMs (Claude, Kimi, Copilot, OpenCode, etc.) trabajando en este Obsidian vault.

## Propósito

Este vault es el **Second Brain** del proyecto [[PROJECT_NAME]] - [breve descripción del proyecto].

**Location del Repo:** `D:\WSL-Projects\PROJECT_FOLDER`

---

## AI Agent Operating Guidelines

### Workflow Orchestration

1. **Plan Mode First** — Entra en plan mode para CUALQUIER tarea no trivial (3+ pasos o decisiones arquitectónicas). Si algo sale mal, DETENTE y re-planifica inmediatamente. Usa plan mode para verificación, no solo para construcción. Escribe especificaciones detalladas upfront.

2. **Subagent Strategy** — Usa subagentes libremente para mantener limpia la ventana de contexto principal. Delega investigación, exploración y análisis paralelo a subagentes. Para problemas complejos, usa paralelismo.

3. **Self-Improvement Loop** — Después de CUALQUIER corrección del usuario: actualiza `.claude/tasks/lessons/[topic].md` con el patrón. Escribe reglas que prevengan el mismo error. Revisa las lecciones al inicio de cada sesión.

4. **Verification Before Done** — Nunca marques una tarea como completa sin probar que funciona. Corre tests, revisa logs, demuestra corrección. Pregúntate: "¿Un ingeniero senior aprobaría esto?"

5. **Demand Elegance** — Para cambios no triviales: pausa y pregúntate "¿hay una forma más elegante?" Si un fix se siente "hacky", implementa la solución elegante sabiendo todo lo que sabes ahora. Omite para fixes simples.

6. **Autonomous Bug Fixing** — Cuando te reporten un bug: arréglalo. No pidas ayuda. Apunta a logs, errores, tests fallando — luego resuélvelos. Cero hand-holding requerido del usuario.

### Task Management

⚠️ **CRÍTICO: TODOs y Tasks viven EXCLUSIVAMENTE en el Vault de Obsidian** — Nuestra fuente de verdad es el vault. Usa los skills:
- `[PROJECT]-vault-reader` — Consultar estado, TODOs, arquitectura
- `[PROJECT]-vault-writer` — Crear/actualizar documentación (ADRs, Topics, MOCs)
- `[PROJECT]-vault-daily` — Crear Daily Notes
- `[PROJECT]-vault-commit` — Commitear cambios del vault después de CADA modificación

**Archivos locales:** `.claude/tasks/lessons/` — Patrones de comportamiento del agente (organizado por tema: architecture, testing, vault, domain, api, frontend, workflow, general)

### Core Principles

- **Simplicity First** — Haz cada cambio lo más simple posible. Impacto mínimo de código.
- **No Laziness** — Encuentra causas raíz. No fixes temporales. Estándares de desarrollador senior.
- **Minimal Impact** — Los cambios solo deben tocar lo necesario. Evita introducir bugs.

---

## Estructura del Vault (CRÍTICO)

```
Daily Notes/    → YYYY-MM-DD.md (journals diarios, session logs)
Topics/         → Notas atómicas (FLAT - sin subfolders NUNCA)
MOCs/           → Maps of Content (hubs temáticos)
ADRs/           → Architecture Decision Records
Templates/      → Plantillas Obsidian
```

**⚠️ REGLA INQUEBRANTABLE:** Topics/ es FLAT. NUNCA crear subfolders. Si sientes necesidad de organizar, crea un MOC.

---

## Convenciones de Nomenclatura (NUEVO - OBLIGATORIO)

### Daily Notes

**Estructura:** Índice + Detalles (si es necesario)

```
Daily Notes/
├── 2026-02-17.md                           ← ÍNDICE (obligatorio)
└── 2026-02-17 - Contract Testing.md        ← DETALLE (opcional, si el tema es extenso)
```

**Reglas:**
- **Índice** (`YYYY-MM-DD.md`): Resumen del día, temas tratados (3-4 bullets c/u), logros, pendientes, links a detalles
- **Detalle** (`YYYY-MM-DD - Descripcion.md`): Todo lo hecho para ese tema (resumido, no extenso)
- Si el día tuvo solo un tema simple → solo el índice
- Si tuvo múltiples temas extensos → índice + archivos de detalle
- **SOLO archivos .md** (nunca .txt)

### MOCs - Jerarquía de Fases

```
MOCs/
├── Fase 1 - Setup Inicial.md
├── Fase 2 - Modelos Core.md
├── Fase 3 - Domain y Services.md
├── Paso 3.1 - Excepciones Domain.md       ← Paso X.Y: X=fase, Y=paso
├── Paso 3.2 - Value Objects.md
├── Fase 4 - API Layer.md
└── Fase 5 - Testing Avanzado.md
```

**Reglas:**
- **Fases**: `Fase X - Nombre Descriptivo.md` (números secuenciales)
- **Pasos**: `Paso X.Y - Nombre Descriptivo.md` (X=fase padre, Y=número de paso)
- Todo en **español**
- Los pasos se vinculan a su fase padre via `[[Fase X - Nombre]]`

### Topics - Prefijos Categóricos

```
Topics/
├── Arquitectura - Clean Architecture.md
├── Arquitectura - Hexagonal.md
├── BD - PostgreSQL.md
├── BD - RLS Policies.md
├── Testing - E2E Suite.md
├── Testing - Playwright.md
├── Seguridad - XSS Prevention.md
├── Seguridad - JWT Authentication.md
├── Bug - Formularios FloatLabel.md       ← Consolidados en MOC Bug Tracker
├── API - Swagger Documentation.md
├── API - drf-spectacular.md
├── Frontend - Vue.js.md
├── Frontend - PrimeVue.md
├── Backend - Django.md
├── Backend - Domain Services.md
├── Negocio - Evaluacion Docente.md
├── Negocio - Ponderaciones.md
├── DevOps - Docker.md
├── DevOps - Nginx.md
├── Proyecto - Roadmap.md
├── Proyecto - TODOs.md
├── Doc - Developer Onboarding.md
└── Herramienta - Git Workflow.md
```

**Reglas:**
- Prefijo obligatorio: `Categoria - Nombre.md`
- Todo en **español** (salvo que el término técnico requiera inglés)
- **Sin fechas** en los títulos
- Categorías permitidas:
  - `Arquitectura` - Patrones, estilos arquitectónicos
  - `BD` - Base de datos, PostgreSQL, MongoDB, modelos
  - `Testing` - Tests, estrategias, herramientas de testing
  - `Seguridad` - RLS, XSS, autenticación, autorización
  - `Bug` - Bugs conocidos (consolidar en MOC Bug Tracker)
  - `API` - Endpoints, documentación, contratos
  - `Frontend` - Vue, React, componentes UI
  - `Backend` - Django, Node, servicios
  - `Negocio` - Lógica de negocio, dominio
  - `DevOps` - Docker, CI/CD, deployment
  - `Proyecto` - Roadmap, TODOs, progreso
  - `Doc` - Documentación, guías, manuales
  - `Herramienta` - Git, IDEs, utilidades

### ADRs

```
ADRs/
├── ADR-001 PostgreSQL vs MongoDB.md
├── ADR-002 Hash Anonimo Evaluaciones.md
└── ADR-003 RLS Multi-tenant.md
```

**Reglas:**
- Formato: `ADR-XXX Descripcion Breve.md`
- Números secuenciales con padding (001, 002, etc.)
- Estado: proposed → accepted → deprecated/superseded

---

## Reglas Fundamentales

### 1. Link-First Philosophy
- **TODO noun/concepto → [[wiki link]]**
- Años: [[2026]], [[2025]]
- Personas: [[Nombre Persona]]
- Tecnologías: [[React]], [[PostgreSQL]], [[Django]]
- Conceptos: [[Clean Architecture]], [[Multi-tenant]]

### 2. Extreme Brevity
- 1-2 líneas por sección
- Bullets, no párrafos
- Fragments OK: "Auto-gen pages" > "Automatically generate pages"
- NO essay mode

### 3. Atomic Notes
- Un concepto principal por Topic
- Máximo 5 bullets por sección
- Si crece, dividir en sub-topics

### 4. Graph Connectivity
- Cada note debe linkear a 2-3+ otras notes
- NO crear notas aisladas (sin links)
- Crear topic notes inmediatamente si concepto importante no existe

---

## Flujo de Trabajo por Tipo

### Para NUEVO Topic:

1. **Buscar primero** (Grep Topics/)
2. Si existe relacionado → **Editar existente**, no crear nuevo
3. Si no existe → Crear en `Topics/` con template `Topic.md`
4. **Aplicar prefijo categórico**: `Categoria - Nombre.md`
5. **Linkear** desde MOCs relevantes
6. **Actualizar** Daily Note con conexiones

### Para Daily Note:

1. Crear índice `Daily Notes/YYYY-MM-DD.md` (formato ISO)
2. Resumir en 3-5 bullets máximo por tema
3. Si un tema es extenso → crear detalle `YYYY-MM-DD - Tema.md`
4. Linkear a topics/MOCs afectados en Connections
5. Incluir commits/changes si aplica

### Para ADR:

1. Usar template `ADR.md`
2. Nomenclatura: `ADR-XXX Descripcion Breve.md`
3. Status: proposed → accepted → deprecated/superseded
4. Siempre incluir consecuencias (+/-)

### Para MOC:

1. Crear en `MOCs/`
2. Jerarquía de fases: `Fase X - Nombre.md`
3. Pasos: `Paso X.Y - Nombre.md`
4. Usar tags `[moc, index]`
5. Función: Hub que conecta múltiples topics
6. Actualizar cuando se creen topics relacionados

---

## Metadatos (Frontmatter Obligatorio)

### Topics:
```yaml
---
tags: [topic, technical, architecture]  # Ver color system
status: developing  # developing | complete | archived
created: 2026-02-12
---
```

### Daily Notes:
```yaml
---
tags: [daily]
date: 2026-02-12
---
```

### MOCs:
```yaml
---
tags: [moc, index]
created: 2026-02-12
---
```

### ADRs:
```yaml
---
tags: [adr, technical]
status: accepted  # proposed | accepted | deprecated | superseded
created: 2026-02-12
---
```

---

## Cyberpunk Color System (Tags)

**Tier 1 - Estructural:**
- `daily` → **Cyan neon** (Daily notes)
- `moc` → **Magenta neon** (MOCs)

**Tier 2 - Categorías:**
- `technical` → **Lime neon** (Conceptos técnicos)
- `business` → **Gold neon** (Lógica de negocio)
- `tools` → **Orange neon** (Frameworks/libs)

**Tier 3 - Especificidad:**
- `architecture` → **Electric blue** (Arquitecturas)
- `database` → **Bright green** (BD/PostgreSQL)
- `frontend` → **Purple** (Frontend/UI)
- `backend` → **Yellow** (Backend/API)
- `planning` → **Yellow** (TODOs/fases)
- `testing` → **Hot pink** (Testing)
- `implementation` → **Violet** (Implementación)
- `project` → **White** (Proyecto principal)

**Auto-tagging:**
- Arquitectura → `[topic, technical, architecture]`
- Base de datos → `[topic, technical, database]`
- Frameworks → `[topic, technical, tools]`
- Frontend/UI → `[topic, technical, frontend]`
- Backend/API → `[topic, technical, backend]`
- Fases/TODOs → `[topic, planning]`

---

## Sincronización Repo ↔ Vault

### Repo → Vault (Actualizar vault):

| Repo (CLAUDE.md) | Vault (MOC/Topic) |
|------------------|-------------------|
| Phase Overview table | [[Proyecto - Implementation Progress]] |
| Checklist features | [[Proyecto - TODOs]] |
| ADRs en docs/adrs/ | ADRs/ (copia) |
| Test counts | [[Proyecto - Implementation Progress]] |

### Vault → Repo (Actualizar repo):

| Vault | Repo |
|-------|------|
| Decisiones en ADRs | Actualizar CLAUDE.md Architecture |
| Daily Notes (bugs) | Crear issues si críticos |
| Nuevos topics técnicos | Añadir a CLAUDE.md relevant section |

---

## Búsqueda Rápida (Patrones)

**Antes de crear cualquier note:**

```powershell
# Buscar topics relacionados
Get-ChildItem Topics\ -Filter "*.md" | Select-String "keyword"

# Ver MOCs existentes  
Get-ChildItem MOCs\

# Check daily notes recientes
Get-ChildItem "Daily Notes\" | Select-Object -Last 5
```

**Prioridad:** Editar existente > Crear nuevo

---

## Checklist Pre-Creación

- [ ] ¿Ya existe un topic similar? (buscar)
- [ ] ¿Estoy en el folder correcto?
- [ ] ¿Apliqué el prefijo categórico? (`Categoria - Nombre`)
- [ ] ¿Apliqué el template adecuado?
- [ ] ¿Agregué frontmatter con tags correctos?
- [ ] ¿Linkeé a 2-3+ topics existentes?
- [ ] ¿Actualicé MOCs relevantes?
- [ ] ¿Soy conciso (1-2 líneas por sección)?

---

## Qué NUNCA hacer

❌ Crear subfolders en Topics/
❌ Dejar notas sin links (aisladas)
❌ Escribir párrafos largos (>3 líneas)
❌ Crear duplicados sin buscar primero
❌ Olvidar actualizar MOCs
❌ Usar folders para organizar (usar links)
❌ Dejar topics vacíos (solo frontmatter)
❌ Saltar wiki-links en nouns
❌ Usar fechas en títulos de Topics
❌ Crear archivos .txt en Daily Notes
❌ Mezclar idiomas sin justificación técnica

---

## Contacto / Contexto

- **Autor:** [Tu Nombre]
- **Proyecto:** [[PROJECT_NAME]]
- **Repo:** `D:\WSL-Projects\PROJECT_FOLDER`
- **Fase Actual:** [Fase inicial]
- **Stack:** [Tecnologías principales]

---

*Este AGENTS.md debe leerse al inicio de cada sesión con este vault.*
