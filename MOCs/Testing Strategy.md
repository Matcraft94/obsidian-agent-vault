---
tags: [moc, index, testing]
created: 2026-03-05
updated: 2026-03-05
---

# Testing Strategy

Estrategia de testing de [[PROJECT_NAME]].

## 🎯 Objetivos

- Cobertura mínima: [X%]
- Tests unitarios: [framework]
- Tests de integración: [framework]
- Tests E2E: [framework]

## 🧪 Pirámide de Tests

### 1. Unit Tests (Base)
- **Framework:** [pytest/jest/vitest]
- **Ubicación:** `tests/unit/`
- **Cobertura objetivo:** [X%]
- **Ejecución:** `docker compose exec [service] pytest`

### 2. Integration Tests (Medio)
- **Framework:** [pytest/django-test/vitest]
- **Ubicación:** `tests/integration/`
- **Foco:** APIs, DB, servicios externos
- **Ejecución:** `docker compose exec [service] pytest integration/`

### 3. E2E Tests (Cima)
- **Framework:** [Playwright/Cypress]
- **Ubicación:** `e2e/`
- **Foco:** Flujos de usuario críticos
- **Ejecución:** `npx playwright test`

## 📊 Métricas Actuales

| Tipo | Total | Passing | Coverage |
|------|-------|---------|----------|
| Unit | 0 | 0 | 0% |
| Integration | 0 | 0 | 0% |
| E2E | 0 | 0 | - |

## 🔄 CI/CD Integration

- [ ] Tests en pre-commit
- [ ] Tests en PR
- [ ] Coverage reports
- [ ] Failing builds on test failure

## 📝 Convenciones

### Nomenclatura Tests
- `test_[feature]_[scenario].py`
- `test_[component]_[action]_[expected].py`

### Estructura
```
tests/
├── unit/
├── integration/
├── conftest.py
└── factories.py
```

## Links

- [[Implementation Progress]]
- [[Proyecto - TODOs]]
- [[Architecture Decisions]]

---

*Update metrics after each test run*
