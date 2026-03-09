# Lecciones: Mejores Prácticas de Pruebas

## Patrones Clave

### Organización de Pruebas
- **Unit tests**: Funciones puras, sin acceso a DB, rápidas (< 50ms)
- **Integration tests**: Endpoints de API con DB, flujo de datos de prueba
- **E2E tests**: Flujos críticos de usuario, basados en Playwright

### Prueba Antes de Contar
**CRÍTICO**: Nunca declarar conteos de pruebas sin verificación.

```bash
# Verificar que los conteos existen
pytest --collect-only -k "<pattern>"

# Contar pruebas reales
./scripts/count-tests.sh
```

### Las Pruebas Deben Existir Antes de Marcar como Completo
**Anti-Patrón**: Listas de Pruebas Aspiracionales
- ❌ Listar pruebas que planeas escribir
- ❌ Documentar conteos de pruebas de memoria
- ✅ Escribir pruebas primero (TDD)
- ✅ Verificar con `--collect-only` antes de documentar

### Lista de Verificación de Pruebas para Nuevas Features

Antes de marcar una feature como completa:
- [ ] Unit tests para lógica de dominio (Python puro, sin Django)
- [ ] Integration tests para capa de servicios
- [ ] API tests para endpoints (códigos de estado, formato de respuesta)
- [ ] E2E tests para flujos críticos de usuario
- [ ] Casos edge cubiertos (inputs vacíos, nulls, límites)
- [ ] Rutas de error probadas (excepciones, códigos HTTP de error)
- [ ] Tests de RLS para operaciones multi-tenant
- [ ] Tests de rendimiento si aplica

### Requerimientos de Cobertura
- **Mínimo**: 80% de cobertura
- **Capa de dominio**: 90%+ (lógica pura, fácil de probar)
- **Servicios**: 80%+ (lógica de negocio)
- **API**: 70%+ (capa delgada, delega a servicios)

**Nunca hardcodear números de cobertura** - generar desde ejecuciones reales:
```bash
docker compose exec web pytest --cov=apps --cov-report=term-missing
```

### Comandos de Verificación

```bash
# Todas las pruebas
docker compose exec web pytest

# Patrones específicos de prueba
docker compose exec web pytest apps/evaluations/tests/test_api_*.py -v
docker compose exec web pytest apps/evaluations/tests/test_domain_*.py
docker compose exec web pytest apps/core/tests/test_rls.py -v -m rls

# Por nombre
docker compose exec web pytest -k "test_submit_auto"

# Prueba única por path
docker compose exec web pytest apps/evaluations/tests/test_api_evaluations.py::TestEvaluationViewSet::test_create -v

# Con cobertura
docker compose exec web pytest --cov=apps

# Tests de frontend
docker compose exec frontend npm run test:unit
docker compose exec frontend npx playwright test e2e/
```

## Errores Comunes

1. **Faltan Integration Tests**: Nuevas features sin probar el flujo completo
2. **Desfase de Pruebas**: Tests no actualizados cuando el código cambia
3. **Falsos Positivos**: Tests que no verifican realmente el comportamiento
4. **Tests Lentos**: Tests que toman > 1 segundo sin buena razón
5. **Tests Frágiles**: Tests que fallan por cambios menores de implementación
6. **Faltan Casos Edge**: Solo probando el happy path
7. **Sin Cobertura RLS**: Features multi-tenant sin tests de RLS
8. **Documentación Sin Verificación**: Declarar conteos de pruebas que no existen

## Gestión de Datos de Prueba

### Fixtures
- Usar `conftest.py` para fixtures compartidos
- Usar factories (FactoryBoy) para generación de datos de prueba
- Nunca usar datos de producción en tests

### Estado de Base de Datos
- Cada prueba comienza con base de datos limpia
- Usar `@pytest.mark.django_db` para tests con DB
- Usar `transaction=True` para tests que modifican DB

### Mocking
- Mockear servicios/APIs externos
- No mockear lo que es tuyo (prueba tu código real)
- Usar `unittest.mock` o `pytest-mock`

## Testing de RLS

Todas las operaciones multi-tenant requieren contexto RLS:
```python
@pytest.fixture
def in_tenant_a():
    return set_tenant_context(tenant_id='tenant-a')

@pytest.fixture
def as_superuser():
    return set_user_context(is_superuser=True)
```

## Flujo de Trabajo TDD

1. **RED**: Escribir prueba fallante primero
2. **GREEN**: Escribir código mínimo para pasar la prueba
3. **REFACTOR**: Mejorar código manteniendo tests verdes
4. **COVERAGE**: Verificar 80%+ antes de marcar como completo

## Correcciones Aplicadas

<!-- Agregar correcciones aquí a medida que ocurren -->

- 2026-03-08: Agregada lista de verificación de pruebas comprehensiva y comandos de verificación
- 2026-03-08: Documentado el anti-patrón de listas de pruebas aspiracionales
