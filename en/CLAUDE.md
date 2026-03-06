# CLAUDE.md

Guía específica para Claude Code trabajando en [[PROJECT_NAME]].

## Obsidian Vault

**Location:** `D:\WSL-Projects\PROJECT_FOLDER\vault`

ALWAYS update the vault when making architectural decisions, modifying models, or completing work:
- Create/update topics in `Topics/` (flat, NO subfolders)
- Use `[[wiki links]]` for all nouns/concepts
- Update `Daily Notes/YYYY-MM-DD.md` with session progress
- Update relevant MOCs for architectural changes
- Extreme brevity: 1-2 liners, bullets, fragments OK

---

## Convenciones de Nomenclatura del Vault (OBLIGATORIO)

### Daily Notes
```
Daily Notes/
├── 2026-02-17.md                           ← ÍNDICE
└── 2026-02-17 - Contract Testing.md        ← DETALLE (si aplica)
```
- Índice: Resumen del día, temas (3-4 bullets c/u), logros, pendientes
- Detalle: Todo lo hecho para ese tema (resumido)
- SOLO archivos .md

### MOCs - Jerarquía de Fases
```
MOCs/
├── Fase 1 - Setup Inicial.md
├── Fase 2 - Modelos Core.md
├── Fase 3 - Domain y Services.md
├── Paso 3.1 - Excepciones Domain.md       ← X.Y: X=fase, Y=paso
├── Paso 3.2 - Value Objects.md
└── Fase 4 - API Layer.md
```
- Todo en español
- Números secuenciales

### Topics - Prefijos Categóricos
```
Topics/
├── Arquitectura - Clean Architecture.md
├── BD - PostgreSQL.md
├── Testing - E2E Suite.md
├── Seguridad - XSS Prevention.md
├── Bug - Formularios.md                  ← En MOC Bug Tracker
├── API - Swagger.md
├── Frontend - Vue.js.md
├── Backend - Django.md
├── Negocio - Evaluacion.md
├── DevOps - Docker.md
├── Proyecto - Roadmap.md
├── Doc - Onboarding.md
└── Herramienta - Git.md
```
- Prefijo obligatorio: `Categoria - Nombre.md`
- Todo en español
- Sin fechas en títulos

---

## Project Overview

**PROJECT_NAME** - [Descripción breve del proyecto]

**Stack tecnológico:**
- Backend: [e.g., Django 5.0 + DRF + PostgreSQL]
- Frontend: [e.g., Vue 3 + TypeScript + Tailwind]
- Infra: [e.g., Docker, Docker Compose]

**Arquitectura:** [e.g., Modular Monolith + Clean Architecture]

---

## Estructura del Código

```
project/
├── backend/               # Código backend
│   ├── apps/             # Aplicaciones Django
│   ├── config/           # Configuración
│   └── requirements/
├── frontend/             # Código frontend  
│   ├── src/
│   └── tests/
├── docker/               # Configuración Docker
├── docs/                 # Documentación
└── scripts/              # Scripts de utilidad
```

---

## Build, Lint, and Test Commands

### Backend
```bash
# Tests
docker-compose exec web pytest
docker-compose exec web pytest apps/module/tests/ -v

# Linting & formatting
docker-compose exec web black apps/
docker-compose exec web isort apps/
docker-compose exec web flake8 apps/

# Migrations
docker-compose exec web python manage.py makemigrations
docker-compose exec web python manage.py migrate
```

### Frontend
```bash
# Tests
docker-compose exec frontend npm run test:unit
docker-compose exec frontend npm run build

# Linting
docker-compose exec frontend npm run lint
docker-compose exec frontend npm run format
```

---

## Convenciones de Código

### Backend (Python)
- **Formatter:** black (line length 88)
- **Imports:** isort
- **Linter:** flake8
- **Type hints:** Obligatorios en domain/ y services/

### Frontend (TypeScript/Vue)
- **Style:** `<script setup lang="ts">` Composition API only
- **Formatter:** Prettier
- **Linter:** ESLint + oxlint
- **Styling:** Tailwind CSS

---

## Arquitectura

### Domain Layer
- Pure Python, ZERO framework imports
- Value objects, entities, business rules
- FSMs para lifecycle management

### Service Layer
- Django ORM integration
- Transaction boundaries
- Orchestration logic

### API Layer
- Thin controllers
- Serializers para I/O
- Delegar a services

---

## Decisiones Técnicas Clave

| Decisión | Estado | ADR | Fecha |
|----------|--------|-----|-------|
| [Decisión 1] | [proposed/accepted] | [[ADR-001]] | YYYY-MM-DD |
| [Decisión 2] | [proposed/accepted] | [[ADR-002]] | YYYY-MM-DD |

---

## Roadmap / Fases

### Fase 1: [Nombre] - 🔲 In Progress
- [ ] Feature 1
- [ ] Feature 2
- [ ] Feature 3

### Fase 2: [Nombre] - 🔲 Planned
- [ ] Feature 4
- [ ] Feature 5

**Nota:** Las fases deben seguir la nomenclatura `Fase X - Nombre.md` en MOCs/ y referenciarse con `[[Fase X - Nombre]]`.

---

## 🤖 Skills Disponibles

### Vault Skills (USAR PRIMERO)

| Skill | Uso | Cuándo activar |
|-------|-----|----------------|
| **template-vault-reader** | Consultar información del vault | Cualquier pregunta sobre estado, arquitectura, topics |
| **template-vault-writer** | Crear/modificar documentación | Crear ADRs, Topics, actualizar MOCs |
| **template-vault-daily** | Crear Daily Notes | Registrar sesión, crear nota diaria |
| **template-vault-commit** | Commitear cambios del vault | Después de CADA modificación al vault |

**⚠️ REGLA DE ORO:** Siempre usar vault-reader antes de leer código. Siempre commitear después de escribir al vault.

---

## Recursos

- Documentación: [URL o ruta]
- API Docs: [URL]
- Staging: [URL]
- Producción: [URL]

---

*Actualizado: YYYY-MM-DD*
