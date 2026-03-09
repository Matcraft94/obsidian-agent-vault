---
cssclass: dataset-note
tags:
  - dataset
  - data
  - analysis
name: ""
source: ""
rows:
cols:
format: ""
quality_score: medium
created: "{{date:YYYY-MM-DD}}"
modified: "{{date:YYYY-MM-DD}}"
---

# Dataset: {{title}}

## Información General

- **Nombre:** {{title}}
- **Fuente:** URL o referencia
- **Filas:** n = X,XXX
- **Columnas:** p = XX
- **Formato:** CSV / Parquet / HDF5 / etc.
- **Tamaño:** X MB / GB
- **Calidad:** Alta / Media / Baja
- **Licencia:** 

## Descripción

Breve descripción del dataset, su propósito y contexto de recolección.

## Variables

### Numéricas (N)

| Variable | Tipo | Missing % | Media | Std | Min | Max | Distribución |
|----------|------|-----------|-------|-----|-----|-----|--------------|
| var1 | float | 0% | | | | | |
| var2 | int | 0% | | | | | |

### Categóricas (N)

| Variable | Tipo | Missing % | Únicos | Moda | Distribución |
|----------|------|-----------|--------|------|--------------|
| cat1 | nominal | 0% | | | |
| cat2 | ordinal | 0% | | | |

### Texto (N)

| Variable | Longitud media | N-gramas principales |
|----------|----------------|---------------------|
| text1 | | |

### Target (si aplica)

- **Variable:** target_name
- **Tipo:** Numérica / Categórica / Ordinal
- **Distribución:** 
- **Balanceo:** Sí / No (para categóricas)

## Calidad de Datos

### Missing Values

- **Total:** X% del dataset
- **Variables con missing:**
  - var1: X%
  - var2: X%
- **Patrón:** MCAR / MAR / MNAR

### Outliers

- **Método de detección:** IQR / Z-score / Isolation Forest
- **Variables afectadas:**
  - var1: X outliers (X%)
  - var2: X outliers (X%)

### Duplicados

- **Filas duplicadas:** X (X%)
- **Observaciones únicas:** X

## Estadísticas Descriptivas

### Resumen Numérico

| Estadístico | var1 | var2 | var3 |
|-------------|------|------|------|
| Media | | | |
| Mediana | | | |
| Std | | | |
| Min | | | |
| Max | | | |
| Q1 | | | |
| Q3 | | | |

### Correlaciones

#### Correlaciones Altas (|r| > 0.8)

| Var 1 | Var 2 | r |
|-------|-------|---|
| | | |

#### Correlaciones con Target

| Variable | r / Cramér's V |
|----------|----------------|
| | |

## Distribuciones

### Variables Numéricas

- Histogramas generados: [Ver Figura - Distribuciones Numéricas]
- Boxplots generados: [Ver Figura - Boxplots]

### Variables Categóricas

- Gráficos de barras: [Ver Figura - Distribuciones Categóricas]

## Preprocesamiento Recomendado

- [ ] Manejar missing values
  - Estrategia sugerida: 
- [ ] Tratar outliers
  - Estrategia sugerida: 
- [ ] Codificar variables categóricas
  - Método: One-hot / Ordinal / Target encoding
- [ ] Escalar/normalizar
  - Método: StandardScaler / MinMaxScaler
- [ ] Feature engineering
  - Ideas: 

## Uso en el Proyecto

- **Propósito:** 
- **Experimento que lo usa:** [[Experimento - Nombre]]
- **Modelo que lo usa:** [[Modelo - Nombre]]
- **Análisis relacionado:** [[Análisis - Nombre]]

## Referencias

- [[Paper de donde vienen los datos]]
- [[Proceso de limpieza aplicado]]
- [[Análisis exploratorio realizado]]

---
*Dataset documentado: {{date:YYYY-MM-DD}}*
