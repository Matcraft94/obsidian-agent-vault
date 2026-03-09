---
title: Paper Analyzer
description: Analiza papers PDF académicos, extrae conceptos clave, metodología, resultados y crea notas estructuradas en el vault
triggers:
  - analizar paper
  - analizar PDF
  - procesar paper
  - leer paper
  - extraer paper
  - paper analysis
  - "analyze paper"
  - "process PDF"
  - "paper extraction"
  - "review paper"
category: research
---

# Paper Analyzer Skill

## Propósito

Analizar papers académicos en formato PDF para extraer:
- Metadata (autores, año, venue, DOI)
- Contribuciones principales
- Conceptos clave y definiciones
- Metodología y experimentos
- Resultados y hallazgos
- Relaciones con el proyecto actual

## Triggers de Activación (10+)

### Análisis Completo
1. "analizar paper"
2. "analizar PDF"
3. "procesar paper"
4. "analyze paper"
5. "process PDF"

### Extracción Específica
6. "extraer conceptos del paper"
7. "extraer metodología"
8. "paper extraction"
9. "extract contributions"

### Revisión
10. "leer paper"
11. "review paper"
12. "resumir paper"

## Flujo de Análisis

```
1. Leer PDF → Extraer texto y estructura
2. Identificar secciones → Abstract, Intro, Methods, Results, Conclusion
3. Extraer metadata → Autores, año, venue
4. Identificar conceptos → Definiciones, teoremas, algoritmos
5. Resumir contribuciones → Bullet points concisos
6. Crear nota en vault → Usar template Paper
```

## Extracción de Metadata

### Campos Obligatorios
- **Título**: Del paper o cabecera
- **Autores**: Lista completa con formato APA
- **Año**: Año de publicación
- **Venue**: Revista/conferencia
- **DOI**: Identificador digital (si existe)
- **URL**: Link al paper (arXiv, journal, etc.)

### Campos Opcionales
- **Citas**: Número de citas (Google Scholar)
- **Código**: URL a repositorio de código
- **Datos**: URL a dataset utilizado

## Estructura de Extracción

### 1. Resumen (Abstract)
- 2-3 líneas del resumen original
- Traducción si está en inglés

### 2. Contribuciones Principales
- Bullet points de 1-2 líneas cada uno
- Máximo 5 contribuciones clave

### 3. Conceptos Clave
- Definiciones importantes extraídas
- Con notación matemática si aplica
- Links a conceptos existentes en el vault

### 4. Metodología
- Diseño experimental o metodológico
- Datos utilizados
- Algoritmos/procedimientos principales

### 5. Resultados
- Hallazgos principales
- Métricas clave
- Comparaciones con baseline

### 6. Limitaciones
- Limitaciones mencionadas por autores
- Limitaciones identificadas por el analista

### 7. Relación con Proyecto
- Cómo se relaciona con tu investigación
- Posibles citas
- Conceptos a integrar

## Nomenclatura de Notas de Paper

Formato: `AUTOR-AÑO-Titulo_Abreviado.md`

Ejemplos:
- `Carlsson-2009-Topology_and_Data.md`
- `Zomorodian-2005-Computing_Persistent_Homology.md`
- `Bauer-2021-Ripser_Efficient_Computation.md`

## Template de Output

```markdown
---
cssclass: paper-note
tags: [paper, bibliography, research]
authors: []
year:
venue: ""
doi: ""
url: ""
priority: essential
status: procesado
citas_en_documento: []
created: YYYY-MM-DD
modified: YYYY-MM-DD
---

# Título del Paper

## Metadata
- **Autores:** 
- **Año:** 
- **Venue:** 
- **DOI:** 
- **URL:** 
- **Citas:** (Google Scholar)
- **Código:** (si disponible)
- **Datos:** (si disponible)

## Resumen

2-3 líneas del resumen.

## Contribuciones Principales

1. Contribución clave 1 (1-2 líneas)
2. Contribución clave 2 (1-2 líneas)
3. Contribución clave 3 (1-2 líneas)

## Conceptos Clave

- [[Concepto 1]]: Definición o explicación breve
- [[Concepto 2]]: Definición o explicación breve
- [[Concepto 3]]: Definición o explicación breve

## Metodología

### Datos
- **Dataset:** Nombre
- **Tamaño:** n=...
- **Características:** ...

### Métodos
- Algoritmo/prueba utilizada
- Parámetros clave
- Diseño experimental

## Resultados

| Métrica | Valor | Baseline | Notas |
|---------|-------|----------|-------|
| Métrica 1 | X% | Y% | ... |
| Métrica 2 | A | B | ... |

### Hallazgos Principales

1. Hallazgo 1 (1-2 líneas)
2. Hallazgo 2 (1-2 líneas)
3. Hallazgo 3 (1-2 líneas)

## Limitaciones

- Limitación 1 (mencionada por autores o identificada)
- Limitación 2

## Relación con el Proyecto

- **Aplicable a:** [[Tema de investigación]]
- **Posibles citas en:** [[Sección relacionada]]
- **Conceptos a integrar:** [[Concepto nuevo]]
- **Comparación con:** [[Paper similar]]

## Citas y Referencias

- [[Paper Relacionado 1]] - Relación: ...
- [[Paper Relacionado 2]] - Relación: ...
- [[Paper citado]] - Contenido relevante

## Notas Adicionales

- Notas personales sobre el paper
- Ideas para futuro
- Conexiones descubiertas

---
*Procesado: YYYY-MM-DD*
```

## Sistema de Prioridad

| Prioridad | Significado | Acción |
|-----------|-------------|--------|
| `#essential` | Paper fundamental del campo | Debe citarse en monografía |
| `#recommended` | Recomendado incluir | Citación valiosa |
| `#optional` | Opcional | Incluir si hay espacio |

## Sistema de Estado

| Estado | Significado |
|--------|-------------|
| `#procesado` | Análisis completo, no citado aún |
| `#en_revision` | Pendiente de revisión/validación |
| `#cited` | Ya citado en monografía |

## Integración con Otros Skills

- Después de analizar → Usar `vault-writer` para crear nota
- Para validar → Usar `methodology-validator`
- Para gestionar citas → Usar `biblio-review`
- Para commitear → Usar `vault-commit`

## Ejemplo de Uso

**Usuario**: "Analiza este paper sobre TDA"

**Flujo**:
1. Extraer metadata del PDF
2. Identificar secciones clave
3. Extraer conceptos y definiciones
4. Resumir contribuciones
5. Crear nota en `01_Fuentes/Papers/`
6. Agregar links a conceptos relacionados
7. Commitear cambios
