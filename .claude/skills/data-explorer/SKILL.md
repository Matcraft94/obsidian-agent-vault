---
title: Data Explorer
description: Explora datasets, documenta estructura, características, calidad de datos y genera perfiles de datos para análisis
triggers:
  - explorar dataset
  - analizar datos
  - perfil de datos
  - data profiling
  - documentar dataset
  - explore data
  - "explore dataset"
  - "data profiling"
  - "document dataset"
  - "analyze data"
category: data_science
---

# Data Explorer Skill

## Propósito

Explorar y documentar datasets para análisis:
- Perfil de datos (estadísticas descriptivas)
- Calidad de datos (missing values, outliers)
- Estructura y tipos de variables
- Distribuciones y correlaciones
- Documentación en el vault

## Triggers de Activación (10+)

### Exploración
1. "explorar dataset"
2. "analizar datos"
3. "explore data"
4. "analyze data"

### Perfilado
5. "perfil de datos"
6. "data profiling"
7. "profile dataset"
8. "generar perfil"

### Documentación
9. "documentar dataset"
10. "document dataset"
11. "crear documentación datos"

## Flujo de Exploración

```
1. Cargar dataset
2. Analizar estructura (filas, columnas, tipos)
3. Calcular estadísticas descriptivas
4. Identificar missing values
5. Detectar outliers
6. Analizar distribuciones
7. Calcular correlaciones
8. Generar documentación
```

## Dimensiones de Análisis

### 1. Estructura del Dataset
- **Nombre**: Identificador del dataset
- **Filas (n)**: Número de observaciones
- **Columnas (p)**: Número de variables
- **Tamaño**: MB/GB
- **Formato**: CSV, Parquet, HDF5, etc.

### 2. Variables

Para cada variable:
- **Nombre**: Nombre de columna
- **Tipo**: Numérica, categórica, ordinal, texto, fecha
- **Subtipo**: Continua, discreta, nominal, ordinal
- **Missing**: % de valores faltantes
- **Únicos**: Número de valores únicos
- **Rango**: Min/max para numéricas

### 3. Estadísticas Descriptivas

**Numéricas:**
- Media, mediana, moda
- Desviación estándar
- Cuartiles (Q1, Q3)
- Rango intercuartílico (IQR)
- Asimetría (skewness)
- Curtosis

**Categóricas:**
- Moda
- Frecuencias por categoría
- Proporciones
- Número de categorías únicas

### 4. Calidad de Datos

**Missing Values:**
- Recuento por columna
- Porcentaje por columna
- Patrones de missing (MCAR, MAR, MNAR)

**Outliers:**
- Detección con IQR
- Detección con Z-score
- Visualización (boxplots)

**Duplicados:**
- Filas duplicadas
- Observaciones únicas

### 5. Distribuciones

- Histogramas para variables numéricas
- Gráficos de barras para categóricas
- Q-Q plots para normalidad
- Distribuciones multivariadas

### 6. Correlaciones

- Matriz de correlación (Pearson, Spearman)
- Correlaciones altas (|r| > 0.8)
- Multicolinealidad (VIF)
- Correlaciones con target (si aplica)

## Template de Documentación

```markdown
---
cssclass: dataset-note
tags: [dataset, analysis, #tema]
name: ""
source: ""
rows:
cols:
format:
quality_score: #high|medium|low
created: YYYY-MM-DD
---

# Dataset: Nombre

## Información General
- **Nombre:** Dataset Name
- **Fuente:** URL o referencia
- **Filas:** n = X,XXX
- **Columnas:** p = XX
- **Formato:** CSV/Parquet/etc
- **Tamaño:** X MB

## Variables

### Numéricas (N)

| Variable | Tipo | Missing % | Media | Std | Min | Max | Distribución |
|----------|------|-----------|-------|-----|-----|-----|--------------|
| var1 | float | 0% | X.X | X.X | X | X | Normal |
| var2 | int | 2% | X | X | X | X | Skewed |

### Categóricas (N)

| Variable | Tipo | Missing % | Únicos | Moda | Distribución |
|----------|------|-----------|--------|------|--------------|
| cat1 | nominal | 0% | 5 | A | Balanceada |
| cat2 | ordinal | 1% | 3 | B | Desbalanceada |

### Target (si aplica)
- **Variable:** target_name
- **Tipo:** [numérica/categórica]
- **Distribución:** [descripción]

## Calidad de Datos

### Missing Values
- **Total:** X% del dataset
- **Variables con missing:**
  - var1: X%
  - var2: X%

### Outliers
- **Método:** IQR (1.5 * IQR)
- **Variables afectadas:**
  - var1: X outliers (X%)

### Duplicados
- **Filas duplicadas:** X (X%)

## Correlaciones

### Correlaciones Altas (|r| > 0.8)
| Var 1 | Var 2 | r |
|-------|-------|---|
| var1 | var2 | 0.85 |

### Correlaciones con Target
| Variable | r |
|----------|---|
| var1 | 0.65 |
| var2 | -0.43 |

## Distribuciones

### Variables Numéricas
- Histogramas generados
- [Ver Figura - Distribuciones Numéricas]

### Variables Categóricas
- Gráficos de barras generados
- [Ver Figura - Distribuciones Categóricas]

## Preprocesamiento Recomendado

- [ ] Manejar missing values (imputación)
- [ ] Tratar outliers
- [ ] Codificar variables categóricas
- [ ] Escalar/normalizar
- [ ] Crear features

## Uso en el Proyecto

- **Propósito:** [Descripción]
- [[Análisis relacionado]]
- [[Modelo que usa estos datos]]

## Referencias

- [[Paper de donde vienen los datos]]
- [[Proceso de limpieza aplicado]]
```

## Integración con Otros Skills

- Para documentar → Usar `vault-writer`
- Para visualizar → Usar `latex-tikz-generator`
- Para análisis estadístico → Usar `stats-reviewer`
- Para commitear → Usar `vault-commit`

## Ejemplo de Uso

**Usuario**: "Explora este dataset de mnist"

**Flujo**:
1. Cargar datos
2. Calcular estadísticas
3. Identificar missing/outliers
4. Generar visualizaciones
5. Crear nota en `Dataset - MNIST.md`
6. Commitear cambios
