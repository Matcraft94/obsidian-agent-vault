# Lecciones: Mantenimiento del Vault

## Patrones Clave

### Daily Notes
- Crear índice primero: `YYYY-MM-DD.md`
- Agregar archivos de detalle solo si existe contenido sustancial
- Enlazar a topics creados/modificados
- Usar extrema brevedad (1-2 líneas por bullet)

### Actualizaciones de MOC
- Actualizar cuando se crean nuevos topics
- Enlazar fases y pasos correctamente
- Mantener progreso de implementación actualizado
- Archivar fases completadas

## Protocolo de Auditoría Trimestral

**Cada 3 meses, realizar auditoría completa:**

1. **Validación de Links**
   - Ejecutar `./scripts/validate-links.sh`
   - Corregir todos los wiki-links rotos
   - Archivar o crear targets faltantes

2. **Revisión de MOCs**
   - Verificar que todas las fases estén actualizadas
   - Archivar fases completadas
   - Actualizar porcentajes de progreso

3. **Higiene de Topics**
   - Asegurar que todos los Topics usen prefijo categórico
   - Verificar topics huérfanos (no enlazados desde ningún MOC)
   - Consolidar topics duplicados

4. **Revisión de ADRs**
   - Actualizar estado de ADRs obsoletos
   - Marcar ADRs superseded apropiadamente
   - Archivar decisiones deprecated

5. **Verificación de Métricas**
   - Re-ejecutar scripts de conteo de pruebas
   - Actualizar cualquier número hardcodeado
   - Verificar que el progreso de implementación coincida con la realidad

## Revisión Mensual Rápida

**Revisión de 30 minutos:**
- [ ] Verificación de links rotos
- [ ] Nuevos topics enlazados a MOCs
- [ ] Daily Notes correctamente indexados
- [ ] Sin archivos huérfanos en Topics/

## Revisión Semanal

**Sincronización de 10 minutos:**
- [ ] Daily Notes creados esta semana
- [ ] Topics creados esta semana enlazados
- [ ] MOCs actualizados con progreso

## Checks Pre-Commit (Automatizados)

```bash
# Ejecutar antes de CADA commit
./scripts/validate-links.sh
./scripts/check-orphans.sh
```

## Reglas de Higiene del Vault

### Convenciones de Nomenclatura
- **MOCs**: `Fase X - Nombre.md` (fases), `Paso X.Y - Nombre.md` (pasos)
- **Topics**: `Categoria - Nombre.md` (prefijo categórico obligatorio)
- **ADRs**: `ADR-XXX Descripcion Breve.md` (secuencial con padding)
- **Daily Notes**: `YYYY-MM-DD.md` (formato ISO)

### Organización de Archivos
- **NO subfolders en Topics/** - estructura plana solamente
- **MOCs** rastrean fases y progreso
- **ADRs** rastrean decisiones arquitectónicas
- **Daily Notes** rastrean trabajo cronológicamente

### Idioma
- **Español consistente** (excepto términos técnicos)
- **Sin idiomas mezclados** en el mismo documento
- **Términos técnicos** en inglés con explicación

### Etiquetado
- Usar sistema de colores Cyberpunk consistentemente
- Tier 1 (estructural): `daily`, `moc`
- Tier 2 (categorías): `technical`, `business`, `tools`
- Tier 3 (específico): `architecture`, `database`, `frontend`, etc.

## Problemas Comunes

| Problema | Detección | Solución |
|----------|-----------|----------|
| Wiki-links rotos | `./scripts/validate-links.sh` | Crear target o remover link |
| Topics huérfanos | `./scripts/check-orphans.sh` | Enlazar a MOC relevante |
| Tags faltantes | Escaneo visual | Agregar tags apropiados |
| Idiomas mezclados | Buscar mezcla de inglés/español | Estandarizar a español |
| ADRs obsoletos | Revisar ADRs con fechas viejas | Actualizar estado |
| Violación de estructura plana | Verificar Topics/ por subfolders | Mover a estructura plana |

## Lista de Verificación de Prevención

**Antes de agregar nuevo contenido:**
- [ ] Prefijo categórico para Topics
- [ ] Tags apropiados en frontmatter
- [ ] Links a 2-3+ notas existentes
- [ ] MOC actualizado con nuevo contenido

**Antes de modificar contenido existente:**
- [ ] Verificar links existentes a esta nota
- [ ] Actualizar notas dependientes si cambia la estructura
- [ ] Verificar que no se creen links rotos

**Antes de archivar/eliminar:**
- [ ] Verificar links entrantes
- [ ] Actualizar o remover referencias
- [ ] Asegurar que no se pierda información crítica

## Cronograma de Mantenimiento

| Tarea | Frecuencia | Tiempo |
|-------|------------|--------|
| Validación de links | Pre-commit | < 1 min |
| Verificación de huérfanos | Semanal | 5 min |
| Revisión de MOCs | Mensual | 30 min |
| Auditoría completa | Trimestral | 2 horas |
| Revisión de ADRs | Trimestral | 1 hora |

## Procedimientos de Emergencia

**Vault se desincroniza:**
1. Detener toda creación de nuevo contenido
2. Ejecutar validación completa: `./scripts/validate-all.sh`
3. Corregir links rotos críticos primero
4. Actualizar AGENTS.md con lecciones aprendidas
5. Reanudar con disciplina más estricta

**Reorganización mayor necesaria:**
1. Crear branch de backup
2. Documentar estado actual
3. Planificar reorganización en ADR
4. Ejecutar con verificación en cada paso
5. Actualizar todas las referencias

## Correcciones Aplicadas

<!-- Agregar correcciones aquí a medida que ocurren -->

- 2026-03-08: Establecido cronograma de mantenimiento trimestral/mensual/semanal
- 2026-03-08: Agregados requerimientos de validación automatizada y tabla de problemas comunes
