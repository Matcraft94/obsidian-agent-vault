# Lecciones: Sincronización de Documentación

## Lecciones Críticas

### Lección 1: El Desfase de Documentación es Real
**Problema:** Los conteos de pruebas estaban 40-70% desactualizados en los archivos de documentación
**Impacto:** Decisiones basadas en datos incorrectos
**Causa Raíz:** Múltiples fuentes de verdad, actualizaciones manuales
**Solución:** Automatizar conteos, fuente única de verdad

### Lección 2: Verificar Antes de Vincular
**Problema:** Wiki-links a Topics inexistentes
**Impacto:** Referencias rotas, confusión
**Causa Raíz:** Se creó documentación antes de asegurar que los destinos existían
**Solución:** Validación pre-commit de todos los links [[...]]

### Lección 3: Documentación Aspiracional
**Problema:** Se documentaron pruebas que no existen
**Impacto:** Falsa sensación de completitud, stakeholders engañados
**Causa Raíz:** Escribir "lo que debería ser" en lugar de "lo que es"
**Solución:** Verificar existencia antes de documentar

### Lección 4: Implementación Sin Integración
**Problema:** El código existe pero no está integrado/probado
**Impacto:** Feature inaccesible, esfuerzo desperdiciado
**Causa Raíz:** Marcar tareas completas sin verificación end-to-end
**Solución:** Prueba de integración obligatoria

### Lección 5: Supuestos Silenciosos
**Problema:** Se asumió que el equipo conocía las convenciones sin documentarlas
**Impacto:** Aplicación inconsistente de patrones
**Causa Raíz:** Conocimiento tribal no documentado
**Solución:** Documentar cada convención explícitamente

### Lección 6: ADRs Obsoletoss
**Problema:** Los ADRs se crearon pero nunca se actualizaron cuando las decisiones cambiaron
**Impacto:** Se referenciaron decisiones incorrectas, confusión sobre el estado actual
**Causa Raíz:** No existe proceso para actualizar ADRs cuando las decisiones evolucionan
**Solución:** Revisar ADRs trimestralmente, actualizar estado inmediatamente cuando cambien las decisiones

## Reglas de Prevención

1. **Política de Cero Desfase Documental** - Nunca permitir que las métricas tengan más de 1 día de desfase
2. **Verificar Antes de Vincular** - Todos los links [[...]] deben apuntar a archivos existentes antes del commit
3. **Fuente Única de Verdad** - Los conteos/métricas deben ser auto-generados, nunca hardcodeados
4. **Decisión → ADR Primero** - Ninguna decisión arquitectónica sin documentación ADR previa
5. **Enjambre de Agentes Obligatorio** - Mínimo 3 agentes para cambios que afecten documentación
6. **Prueba de Integración Obligatoria** - Todas las nuevas features requieren prueba HTTP 200 antes de marcar como completa
7. **Documentación Antes del Código** - Actualizar vault ANTES de implementar (fase de planificación)

## Validaciones Automatizadas

```bash
# Conteos de pruebas (auto-generados)
./scripts/count-tests.sh > docs/test-counts.md

# Validación de links
./scripts/validate-links.sh

# Pre-commit hook
pre-commit run --all-files
```

## Lista de Verificación de Sincronización de Documentación

Antes de marcar cualquier tarea como completa:
- [ ] Código implementado y probado
- [ ] Las pruebas realmente existen (verificadas con `pytest --collect-only`)
- [ ] Wiki-links validados (ejecutar `./scripts/validate-links.sh`)
- [ ] Topics creados para nueva funcionalidad
- [ ] ADRs actualizados para decisiones arquitectónicas
- [ ] Conteos de pruebas en AGENTS.md verificados y actualizados
- [ ] MOCs actualizados con nuevos topics/fases
- [ ] Daily Note enlaza a las áreas afectadas

## Anti-Patrones Comunes

| Anti-Patrón | Por Qué es Malo | Solución |
|-------------|-----------------|----------|
| Métricas hardcodeadas | Se vuelven obsoletas inmediatamente | Usar scripts para auto-generar |
| Links a archivos futuros | Referencias rotas | Crear archivo destino primero, luego vincular |
| Documentación copy-paste | Inconsistencia, desfase | Referenciar fuente única |
| Documentar intenciones | Nunca coincide con la realidad | Documentar lo que ES, no lo que DEBERÍA SER |
| Creación única de docs | Se vuelven obsoletos | Programar revisiones trimestrales |

## Correcciones de Emergencia

**Cuando se encuentre documentación incorrecta:**
1. DETENER y corregir inmediatamente
2. Actualizar lecciones en AGENTS.md con la causa raíz
3. Corregir la documentación
4. Si está relacionado con métricas, agregar validación automatizada para prevenir recurrencia
5. Comunicar al equipo qué estaba mal y cómo evitarlo

## Correcciones Aplicadas

<!-- Agregar correcciones aquí a medida que ocurren -->

- 2026-03-08: Creadas lecciones de documentación comprehensivas basadas en patrones de desfase
- 2026-03-08: Establecidos requerimientos de validación automatizada para todas las métricas
