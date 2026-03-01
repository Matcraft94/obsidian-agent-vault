---
tags: [refactor, technical, implementation]
status: planned  # planned | in-progress | complete | reverted
scope: local  # local | component | module | system-wide
impact: low  # low | medium | high
created: {{date:YYYY-MM-DD}}
---

# REFACTOR: {{title}}

**Status:** ⚪ Planned | 🟡 In Progress | 🟢 Complete | 🔴 Reverted
**Scope:** Local | Component | Module | System-wide
**Impact:** 🟢 Low | 🟡 Medium | 🔴 High
**Motivación:** [[Technical Debt]] | [[Performance]] | [[Maintainability]]

---

## Motivación

*¿Por qué hacer este refactor? Qué problema resuelve.*

---

## Cambios Propuestos

### Antes

```python
# Código original (problema)
```

### Después

```python
# Código refactorizado (solución)
```

---

## Riesgos

| Riesgo | Mitigación |
|--------|------------|
| Riesgo 1 | Mitigación 1 |
| Riesgo 2 | Mitigación 2 |

---

## Plan de Migración

1. **Fase 1:** Preparación (tests, abstracciones)
2. **Fase 2:** Migración gradual
3. **Fase 3:** Cleanup (remover código viejo)
4. **Fase 4:** Validación

---

## Checklist

- [ ] Tests existen y pasan (antes)
- [ ] Nuevo código tiene tests
- [ ] Documentación actualizada
- [ ] API/contracts preservados (o migrados)
- [ ] Performance validada (si aplica)
- [ ] Code review aprobado

---

## Métricas

| Métrica | Antes | Después | Mejora |
|---------|-------|---------|--------|
| Líneas de código | X | Y | Z% |
| Complejidad ciclomatica | X | Y | Z% |
| Coverage | X% | Y% | Z% |
| Tiempo ejecución | Xs | Ys | Z% |

---

## Related

- Motivado por: [[Daily Notes/YYYY-MM-DD]]
- Implementado en: PR #XXX
- Documentación: [[Architecture Decision]]

---

#refactor #technical #implementation
