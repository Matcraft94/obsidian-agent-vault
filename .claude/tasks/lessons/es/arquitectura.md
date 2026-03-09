# Lecciones: Documentación de Arquitectura

## Patrones Clave

### Proceso de ADR (Architecture Decision Records)

**Obligatorio para todas las decisiones arquitectónicas:**
1. Documentar decisión ANTES de la implementación
2. Incluir: Contexto, Decisión, Consecuencias (+/-)
3. Actualizar estado: proposed → accepted → deprecated → superseded

**Flujo de Estados:**
- 🟡 **proposed**: Decisión siendo considerada
- 🟢 **accepted**: Decisión aprobada y siendo implementada
- 🔴 **rejected**: Decisión considerada pero no aceptada
- ⚪ **deprecated**: Decisión ya no relevante
- 🔄 **superseded**: Reemplazada por ADR más nuevo (enlazar a reemplazo)

### Reglas de Clean Architecture

**Separación de Capas (obligatorio):**

| Capa | Responsabilidad | Importaciones Permitidas |
|------|-----------------|--------------------------|
| **Dominio** (`domain/`) | Lógica de negocio pura, value objects, FSMs | Solo librería estándar |
| **Servicios** (`services/`) | Orquestación de lógica de negocio | Django ORM, capa de dominio |
| **API** (`api/`) | Interfaz HTTP, capa delgada | DRF, capa de servicios |

**Reglas de la Capa de Dominio:**
- Cero importaciones de Django (Python puro)
- Value objects: inmutables, validados en creación
- FSMs: transiciones de estado definidas explícitamente
- Excepciones: específicas de dominio, heredan de DomainError base

**Reglas de la Capa de Servicios:**
- Clases stateless con métodos `@classmethod`
- Usar `@transaction.atomic` para operaciones de escritura
- Helpers privados son `@staticmethod`
- Stacking de decoradores: `@classmethod` arriba

**Reglas de la Capa de API:**
- Capa delgada - sin lógica de negocio
- Delegar a servicios para todas las operaciones
- Manejar solo preocupaciones HTTP (códigos de estado, serialización)
- Usar exception handler para mapear errores de dominio a HTTP

## Documentación Requerida por Tipo de Feature

### Feature de Backend
- [ ] Lógica de dominio documentada (si es compleja)
- [ ] Métodos de servicio anotados
- [ ] Endpoints de API con specs OpenAPI
- [ ] ADR si es decisión arquitectónica

### Feature de Frontend
- [ ] Arquitectura de componentes documentada
- [ ] Store/gestión de estado explicada
- [ ] Patrón de integración con API documentado
- [ ] Tipos TypeScript definidos

### Cambio de Base de Datos
- [ ] Cambios de esquema en migración
- [ ] Estrategia de indexación documentada
- [ ] Políticas de RLS actualizadas (si es multi-tenant)
- [ ] ADR si es cambio significativo

### Cambio de API
- [ ] Esquema OpenAPI actualizado
- [ ] Versionado considerado
- [ ] Breaking changes documentados
- [ ] Guía de migración si es breaking

## Errores Comunes

1. **Implementación Antes del ADR**: Codificar antes de documentar la decisión
2. **Polución del Dominio**: Importaciones de Django en capa de dominio
3. **Servicios Inflados**: Lógica de negocio en API/views en lugar de servicios
4. **Abstracción Faltante**: Llamadas directas a ORM esparcidas por el código
5. **God Classes**: Servicios o views con demasiadas responsabilidades
6. **Acoplamiento Fuerte**: Importaciones directas entre módulos (usar signals/eventos)
7. **Abstracción Prematura**: Over-engineering de features simples
8. **Sin State Machines**: Lógica de estado compleja sin FSMs

## Lista de Verificación de Decisiones Arquitectónicas

Antes de implementar:
- [ ] ADR creado con Contexto, Decisión, Consecuencias
- [ ] Alternativas consideradas y documentadas
- [ ] Revisión del equipo completada
- [ ] Estado de decisión: proposed
- [ ] Topics/MOCs relacionados actualizados

Después de implementar:
- [ ] Estado de ADR actualizado a accepted
- [ ] Implementación coincide con ADR
- [ ] Code review aprobada
- [ ] Documentación actualizada

## Límites de Módulos

**Forzados por reglas de importación:**
- NO importaciones directas entre apps (excepto `core`)
- Usar Django signals para comunicación cross-módulo
- Usar capa de servicios para comunicación intra-app

## Patrón FSM (Finite State Machine)

**Requerido para transiciones de estado complejas:**
```python
class EvaluationState(str, Enum):
    DRAFT = "draft"
    CONFIGURED = "configured"
    ACTIVE = "active"
    CLOSED = "closed"
    ARCHIVED = "archived"

_TRANSITIONS = {
    EvaluationState.DRAFT: {EvaluationState.CONFIGURED},
    EvaluationState.CONFIGURED: {EvaluationState.ACTIVE},
    # ...
}
```

## Patrón de Value Object

**Inmutable, validado en creación:**
```python
@dataclass(frozen=True)
class Weight:
    value: Decimal
    
    def __post_init__(self):
        if not (0 <= self.value <= 1):
            raise DomainError("Weight must be between 0 and 1")
```

## Correcciones Aplicadas

<!-- Agregar correcciones aquí a medida que ocurren -->

- 2026-03-08: Proceso de ADR expandido con flujo de estados
- 2026-03-08: Documentada la documentación requerida por tipo de feature
