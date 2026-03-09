---
title: Bibliography Review
description: Revisión bibliográfica sistemática, validación de formato BibTeX, identificación de gaps y gestión de referencias
triggers:
  - revisar bibliografía
  - validar bibtex
  - encontrar gaps
  - gestionar referencias
  - bibliography review
  - check citations
  - "review bibliography"
  - "validate references"
  - "find gaps"
  - "citation management"
category: research
---

# Bibliography Review Skill

## Propósito

Gestionar y validar la bibliografía del proyecto:
- Validar formato BibTeX
- Identificar referencias faltantes
- Detectar citas obsoletas
- Sugerir literatura actualizada
- Verificar integridad de citas

## Triggers de Activación (10+)

### Revisión
1. "revisar bibliografía"
2. "bibliography review"
3. "revisar referencias"
4. "check citations"

### Validación
5. "validar bibtex"
6. "validate references"
7. "comprobar formato citas"

### Gaps
8. "encontrar gaps"
9. "find gaps"
10. "literatura faltante"

### Gestión
11. "gestionar referencias"
12. "citation management"
13. "organizar bibliografía"

## Funcionalidades

### 1. Validación de BibTeX

Verificar que las entradas BibTeX cumplan:
- Campos requeridos según tipo
- Formato consistente
- Sin caracteres especiales mal codificados
- Cross-references válidas

#### Campos por Tipo de Entrada

**@article**
- Required: author, title, journal, year
- Optional: volume, number, pages, month, doi

**@inproceedings**
- Required: author, title, booktitle, year
- Optional: editor, volume, number, series, pages, address, month, organization, publisher

**@book**
- Required: author/editor, title, publisher, year
- Optional: volume, series, address, edition, month

**@phdthesis/mastersthesis**
- Required: author, title, school, year
- Optional: type, address, month, note

### 2. Identificación de Gaps

Analizar cobertura temática:
- ¿Hay papers fundamentales no incluidos?
- ¿Falta literatura reciente (últimos 2-3 años)?
- ¿Hay sesgo hacia ciertos autores/venues?
- ¿Faltan perspectivas divergentes?

### 3. Detección de Obsolescencia

Identificar citas potencialmente obsoletas:
- Papers citados con versiones más recientes
- Métodos reemplazados por alternativas mejores
- Software con versiones actualizadas

### 4. Sugerencias de Literatura

Buscar papers relacionados no incluidos:
- Who cited this paper?
- Similar papers in same venue
- Recent surveys/reviews

## Flujo de Revisión Bibliográfica

```
1. Cargar bibliografía actual
2. Validar formato BibTeX
3. Analizar cobertura temática
4. Identificar gaps
5. Buscar literatura faltante
6. Sugerir actualizaciones
7. Generar reporte
```

## Reporte de Revisión

```markdown
# Revisión Bibliográfica - YYYY-MM-DD

## Estadísticas
- **Total referencias:** N
- **Papers procesados:** N
- **Citas en monografía:** N

## Validación BibTeX
- ✅ Entradas válidas: N
- ⚠️  Advertencias: N
- ❌ Errores: N

### Errores Encontrados
| Entrada | Error | Solución |
|---------|-------|----------|
| key1 | Campo faltante | Agregar journal |
| key2 | Año inválido | Corregir formato |

## Cobertura Temática

### Por Año
- 2020-2024: N papers (X%)
- 2015-2019: N papers (X%)
- Antes 2015: N papers (X%)

### Por Tipo
- Artículos: N (X%)
- Conferencias: N (X%)
- Libros: N (X%)
- Tesis: N (X%)

## Gaps Identificados

### Literatura Fundamental Faltante
- [ ] Autor-Año: Título (por qué es importante)

### Literatura Reciente Faltante
- [ ] Autor-2024: Título

### Perspectivas Divergentes
- [ ] Autor-Año: Título alternativo

## Sugerencias de Actualización

### Reemplazar Versiones Antiguas
- Reemplazar: Autor-2010
- Por: Autor-2023 (mejor metodología)

### Agregar Surveys
- [ ] Survey reciente sobre tema X

## Próximos Pasos
- [ ] Procesar papers prioritarios
- [ ] Corregir errores BibTeX
- [ ] Actualizar versiones obsoletas
```

## Integración con Otros Skills

- Después de analizar papers → Usar `paper-analyzer`
- Para agregar referencias → Usar `vault-writer`
- Para validar LaTeX → Usar `latex-validator` (si existe)
- Para commitear → Usar `vault-commit`

## Ejemplo de Uso

**Usuario**: "Revisa la bibliografía y encuentra gaps"

**Flujo**:
1. Leer archivo `.bib` actual
2. Validar cada entrada
3. Comparar con papers procesados en vault
4. Identificar papers no citados
5. Analizar cobertura por año/tema
6. Generar reporte con sugerencias
7. Crear nota en vault con hallazgos
