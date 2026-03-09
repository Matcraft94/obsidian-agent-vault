---
title: Stats Reviewer
description: Revisión estadística, validación de supuestos, selección de pruebas apropiadas e interpretación correcta de resultados
triggers:
  - revisar estadística
  - validar supuestos
  - statistical review
  - check statistics
  - interpretar resultados
  - "statistical review"
  - "check assumptions"
  - "validate statistics"
  - "interpret results"
  - "statistical test"
category: research
---

# Stats Reviewer Skill

## Propósito

Revisar análisis estadísticos para garantizar:
- Selección apropiada de pruebas
- Validación de supuestos
- Interpretación correcta de resultados
- Reporte estadístico apropiado
- Detección de errores comunes

## Triggers de Activación (10+)

### Revisión
1. "revisar estadística"
2. "statistical review"
3. "check statistics"
4. "validate statistics"

### Supuestos
5. "validar supuestos"
6. "check assumptions"
7. "assumption check"
8. "test assumptions"

### Interpretación
9. "interpretar resultados"
10. "interpret results"
11. "explain statistics"

### Pruebas
12. "statistical test"
13. "qué prueba usar"
14. "which test"

## Guía de Selección de Pruebas

### 1. Una Variable, Comparación de Medias

**Paramétrica (normalidad + homocedasticidad):**
- Una muestra: One-sample t-test
- Dos muestras independientes: Independent samples t-test
- Dos muestras pareadas: Paired t-test
- Más de dos muestras: One-way ANOVA

**No paramétrica:**
- Una muestra: Wilcoxon signed-rank
- Dos muestras independientes: Mann-Whitney U
- Dos muestras pareadas: Wilcoxon signed-rank
- Más de dos muestras: Kruskal-Wallis

### 2. Una Variable, Comparación de Proporciones

- Chi-square goodness of fit
- Binomial test

### 3. Dos Variables (Asociación)

**Ambas continuas:**
- Pearson correlation (paramétrica)
- Spearman correlation (no paramétrica)
- Regresión lineal

**Una continua, una categórica:**
- Point-biserial correlation (dicotómica)
- ANOVA (categórica con 3+ niveles)

**Ambas categóricas:**
- Chi-square test of independence
- Fisher's exact test (n < 20)
- Cramér's V (tamaño de efecto)

### 4. Regresión

**Supuestos a verificar:**
- Linealidad
- Independencia de errores
- Homocedasticidad
- Normalidad de residuos
- No multicolinealidad (VIF < 10)

### 5. Machine Learning

**Validación cruzada:**
- k-fold CV (k=5 o 10)
- Stratified CV (clases desbalanceadas)
- Leave-one-out (n pequeño)

**Métricas:**
- Clasificación: Accuracy, Precision, Recall, F1, AUC
- Regresión: MSE, RMSE, MAE, R²
- Ranking: NDCG, MAP

## Validación de Supuestos

### Normalidad

**Tests:**
- Shapiro-Wilk (n < 50)
- Kolmogorov-Smirnov (n ≥ 50)
- Anderson-Darling

**Visual:**
- Histograma + curva normal
- Q-Q plot

**Criterio:** p > 0.05 = normal

### Homocedasticidad (Igualdad de Varianzas)

**Tests:**
- Levene's test
- Bartlett's test (normalidad asumida)
- Fligner-Killeen (no paramétrico)

**Visual:**
- Residuals vs Fitted plot

**Criterio:** p > 0.05 = homocedasticidad

### Independencia

**Verificación:**
- Durbin-Watson (series temporales)
- Diseño del estudio
- No autocorrelación en residuos

### Linealidad

**Visual:**
- Scatter plot
- Residuals vs Fitted

**Test:**
- Rainbow test
- Harvey-Collier test

## Reporte Estadístico Apropiado

### Para Pruebas de Comparación

```
M = X.XX, SD = X.XX vs M = X.XX, SD = X.XX
t(df) = X.XX, p = .XXX, d = X.XX [95% CI: X.XX, X.XX]
```

### Para Correlaciones

```
r(df) = .XX, p = .XXX [95% CI: .XX, .XX]
```

### Para ANOVA

```
F(df1, df2) = X.XX, p = .XXX, η² = .XX
```

### Para Regresión

```
R² = .XX, F(df1, df2) = X.XX, p = .XXX
β = X.XX, t = X.XX, p = .XXX
```

## Errores Comunes a Evitar

### 1. p-hacking
- Hacking: Correr múltiples pruebas sin corrección
- Solución: Bonferroni, FDR (Benjamini-Hochberg)

### 2. Overfitting
- Hacking: Modelo muy complejo para pocos datos
- Solución: Validación cruzada, regularización

### 3. Confundir Correlación con Causalidad
- Hacking: "X correlaciona con Y, entonces X causa Y"
- Solución: Diseños experimentales, control de confusores

### 4. Ignorar Tamaño de Efecto
- Hacking: Reportar solo p-values
- Solución: Siempre reportar tamaño de efecto + CI

### 5. Violación de Supuestos
- Hacking: Usar ANOVA sin verificar normalidad
- Solución: Validar supuestos primero

### 6. Pseudoreplicación
- Hacking: n = mediciones, no = sujetos
- Solución: Análisis jerárquicos, mixed models

## Tamaños de Efecto

| Medida | Pequeño | Mediano | Grande |
|--------|---------|---------|--------|
| Cohen's d | 0.2 | 0.5 | 0.8 |
| Pearson r | 0.1 | 0.3 | 0.5 |
| R² | 0.02 | 0.13 | 0.26 |
| η² (eta-squared) | 0.01 | 0.06 | 0.14 |
| Cramér's V | 0.1 | 0.3 | 0.5 |

## Template de Revisión Estadística

```markdown
# Revisión Estadística - [Análisis]

## Información General
- **Análisis:** Nombre
- **Fecha:** YYYY-MM-DD
- **Revisor:** Nombre

## Descripción del Análisis

### Objetivo
[¿Qué se quiere investigar?]

### Variables
- **Dependiente:** [Tipo, escala]
- **Independientes:** [Tipo, escala]
- **Confusoras:** [Si aplica]

### Datos
- **n:** XXX
- **Missing data:** X%
- **Outliers:** [Tratamiento]

## Selección de Prueba

### Prueba Seleccionada
[Nombre de la prueba]

### Justificación
[¿Por qué esta prueba es apropiada?]

### Alternativas Consideradas
- [ ] Alternativa 1: [Por qué no se usó]
- [ ] Alternativa 2: [Por qué no se usó]

## Validación de Supuestos

### Normalidad
| Variable | Test | Estadístico | p-value | ¿Cumple? |
|----------|------|-------------|---------|----------|
| var1 | Shapiro-Wilk | W = .XX | .XXX | ✅/❌ |

**Decisión:** [Proceder/Transformar/Usar no paramétrica]

### Homocedasticidad
| Variable | Test | Estadístico | p-value | ¿Cumple? |
|----------|------|-------------|---------|----------|
| var1 | Levene | W = .XX | .XXX | ✅/❌ |

**Decisión:** [Proceder/Corrección/Welch's ANOVA]

### Independencia
[Verificación mediante diseño/residuos]

**Decisión:** ✅/❌

### Linealidad (si aplica)
[Verificación mediante scatter plot/test]

**Decisión:** ✅/❌

## Resultados

### Estadísticos Principales
```
[Reporte formal con todos los elementos]
```

### Interpretación
[Interpretación en lenguaje claro]

### Magnitud del Efecto
- **Tamaño de efecto:** [Pequeño/Mediano/Grande]
- **Relevancia práctica:** [Interpretación]

## Diagnóstico

### ✅ Fortalezas
1. 
2. 

### ⚠️ Debilidades
1. 
2. 

### ❌ Errores Críticos
1. 

## Recomendaciones

### Inmediatas (antes de publicar)
- [ ] 

### Sugerencias (mejoras)
- [ ] 

## Veredicto

**Estado:** ✅ Correcto / ⚠️ Aceptable con notas / ❌ Incorrecto

**Confianza:** Alta/Media/Baja

## Referencias

- [[Paper que usa método similar]]
- [[Análisis relacionado]]
- [[Dataset analizado]]
```

## Integración con Otros Skills

- Para dataset → Usar `data-explorer`
- Para metodología → Usar `methodology-validator`
- Para documentar → Usar `vault-writer`
- Para commitear → Usar `vault-commit`

## Ejemplo de Uso

**Usuario**: "Revisa este análisis ANOVA"

**Flujo**:
1. Revisar diseño y variables
2. Verificar supuestos
3. Evaluar selección de prueba
4. Revisar reporte de resultados
5. Verificar interpretación
6. Identificar errores/fortalezas
7. Crear nota de revisión
8. Commitear cambios
