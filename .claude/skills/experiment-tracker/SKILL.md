---
title: Experiment Tracker
description: Tracking de experimentos ML/DL, métricas, parámetros, reproducibilidad y comparación de resultados
triggers:
  - trackear experimento
  - experimento ml
  - tracking experiment
  - ml experiment
  - comparar experimentos
  - "track experiment"
  - "ml experiment"
  - "experiment tracking"
  - "log experiment"
  - "record experiment"
category: machine_learning
---

# Experiment Tracker Skill

## Propósito

Documentar y trackear experimentos de Machine Learning y Deep Learning:
- Parámetros de configuración
- Métricas de performance
- Artefactos generados
- Reproducibilidad
- Comparación entre experimentos

## Triggers de Activación (10+)

### Tracking
1. "trackear experimento"
2. "tracking experiment"
3. "track experiment"
4. "log experiment"

### Experimentos
5. "experimento ml"
6. "ml experiment"
7. "experimento deep learning"
8. "run experiment"

### Comparación
9. "comparar experimentos"
10. "compare runs"
11. "experiment comparison"

## Flujo de Tracking

```
1. Definir hipótesis y objetivo
2. Configurar parámetros
3. Ejecutar experimento
4. Registrar métricas
5. Guardar artefactos
6. Documentar resultados
7. Comparar con baseline
```

## Dimensiones a Documentar

### 1. Metadata del Experimento
- **ID**: Identificador único (timestamp o hash)
- **Nombre**: Descripción corta
- **Objetivo**: Hipótesis a validar
- **Fecha**: Inicio y fin
- **Autor**: Quién ejecutó

### 2. Configuración (Parámetros)

**Modelo:**
- Tipo de modelo
- Arquitectura (capas, unidades)
- Hiperparámetros

**Entrenamiento:**
- Optimizador
- Learning rate
- Batch size
- Epochs/iteraciones
- Early stopping

**Datos:**
- Dataset utilizado
- Split (train/val/test)
- Preprocesamiento
- Augmentación

### 3. Métricas

**Performance:**
- Accuracy, Precision, Recall, F1
- AUC-ROC, AUC-PR
- MSE, RMSE, MAE, R²
- Log-loss

**Entrenamiento:**
- Loss (train/val)
- Tiempo por epoch
- Convergencia

**Recursos:**
- Tiempo total
- GPU/CPU utilizado
- Memoria consumida

### 4. Artefactos

- **Modelo**: Archivo del modelo entrenado
- **Checkpoints**: Mejor epoch
- **Logs**: Training logs
- **Config**: Archivo de configuración
- **Predicciones**: Output en test set

### 5. Resultados

- **Conclusiones**: Hallazgos principales
- **Análisis de errores**: Donde falla
- **Visualizaciones**: Curvas, confusion matrix
- **Next steps**: Experimentos futuros

## Template de Experimento

```markdown
---
cssclass: experiment-note
tags: [experiment, ml, #modelo, #dataset]
exp_id: "EXP-YYYYMMDD-XXX"
status: #completed|failed|running
model_type:
dataset:
created: YYYY-MM-DD
---

# Experimento: Nombre

## Metadata
- **ID:** EXP-YYYYMMDD-XXX
- **Nombre:** Descripción corta
- **Objetivo:** Hipótesis a validar
- **Status:** completed/failed/running
- **Fecha:** YYYY-MM-DD
- **Autor:** Nombre

## Configuración

### Modelo
- **Tipo:** [Random Forest, Neural Network, etc.]
- **Arquitectura:**
  ```
  Detalle de capas/arquitectura
  ```

### Hiperparámetros
| Parámetro | Valor |
|-----------|-------|
| learning_rate | 0.001 |
| batch_size | 32 |
| epochs | 100 |
| optimizer | Adam |
| ... | ... |

### Datos
- **Dataset:** [[Dataset - Nombre]]
- **Train/Val/Test:** 70/15/15
- **Preprocesamiento:**
  - Normalización: StandardScaler
  - Imputación: Media
- **Augmentación:** [Si aplica]

## Métricas

### Performance
| Métrica | Valor | Baseline | Δ |
|---------|-------|----------|---|
| Accuracy | 0.85 | 0.80 | +0.05 |
| F1-Score | 0.82 | 0.78 | +0.04 |
| AUC-ROC | 0.91 | 0.88 | +0.03 |

### Entrenamiento
- **Final Train Loss:** 0.XX
- **Final Val Loss:** 0.XX
- **Best Epoch:** XX
- **Tiempo Total:** X min

## Artefactos

- **Modelo:** `models/exp_xxx/model.pkl`
- **Checkpoints:** `models/exp_xxx/best.pt`
- **Logs:** `logs/exp_xxx/`
- **Config:** `configs/exp_xxx.yaml`
- **Predicciones:** `outputs/exp_xxx/predictions.csv`

## Análisis

### Curvas de Entrenamiento
[Ver Figura - Training Curves]

### Confusion Matrix
[Ver Figura - Confusion Matrix]

### Feature Importance (si aplica)
[Ver Figura - Feature Importance]

### Análisis de Errores
- **Falsos Positivos:** X% - [Patrón observado]
- **Falsos Negativos:** X% - [Patrón observado]

## Conclusiones

1. Hallazgo principal 1
2. Hallazgo principal 2
3. Hallazgo principal 3

## Próximos Pasos

- [ ] Experimento 1: Variar hiperparámetro X
- [ ] Experimento 2: Probar arquitectura Y
- [ ] Análisis: Investigar errores en clase Z

## Comparación

### vs Baseline
[Comparación con modelo anterior]

### vs Otros Experimentos
- [[Experimento - Anterior]]
- [[Experimento - Variante A]]

## Referencias

- [[Dataset utilizado]]
- [[Paper de referencia]]
- [[Método aplicado]]
```

## Sistema de Versionado

### Convención de IDs
`EXP-{YYYYMMDD}-{SEQ}`
- Ej: `EXP-20240308-001`

### Control de Versiones
- Major: Cambio de arquitectura
- Minor: Cambio de hiperparámetros
- Patch: Re-run con seed diferente

## Integración con Otros Skills

- Para dataset → Usar `data-explorer`
- Para visualizaciones → Usar `latex-tikz-generator`
- Para métodos → Usar `methodology-validator`
- Para documentar → Usar `vault-writer`

## Ejemplo de Uso

**Usuario**: "Trackea este experimento de red neuronal"

**Flujo**:
1. Identificar parámetros del experimento
2. Documentar configuración
3. Registrar métricas obtenidas
4. Guardar referencias a artefactos
5. Crear nota en `Experimento - Nombre.md`
6. Commitear cambios
