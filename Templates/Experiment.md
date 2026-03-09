---
cssclass: experiment-note
tags:
  - experiment
  - ml
  - research
exp_id: "EXP-{{date:YYYYMMDD}}-001"
status: running
model_type: ""
dataset: ""
objetivo: ""
created: "{{date:YYYY-MM-DD}}"
modified: "{{date:YYYY-MM-DD}}"
---

# Experimento: {{title}}

## Metadata

- **ID:** EXP-{{date:YYYYMMDD}}-001
- **Nombre:** {{title}}
- **Objetivo:** Hipótesis a validar o pregunta de investigación
- **Status:** Running / Completed / Failed
- **Fecha inicio:** {{date:YYYY-MM-DD}}
- **Fecha fin:** 
- **Autor:** 

## Configuración

### Modelo

- **Tipo:** Random Forest / Neural Network / SVM / etc.
- **Arquitectura:**
  ```
  Detalle de capas, unidades, activaciones
  ```

### Hiperparámetros

| Parámetro | Valor | Descripción |
|-----------|-------|-------------|
| learning_rate | 0.001 | Tasa de aprendizaje |
| batch_size | 32 | Tamaño de batch |
| epochs | 100 | Número de épocas |
| optimizer | Adam | Optimizador |
| ... | ... | ... |

### Datos

- **Dataset:** [[Dataset - Nombre]]
- **Train/Val/Test:** 70/15/15
- **n_train:** 
- **n_val:** 
- **n_test:** 

### Preprocesamiento

- **Normalización:** StandardScaler / MinMaxScaler / Ninguna
- **Imputación:** Media / Mediana / KNN / Ninguna
- **Feature engineering:** Descripción
- **Augmentación:** Descripción si aplica

## Métricas

### Performance

| Métrica | Train | Val | Test | Baseline | Δ vs Baseline |
|---------|-------|-----|------|----------|---------------|
| Accuracy | | | | | |
| Precision | | | | | |
| Recall | | | | | |
| F1-Score | | | | | |
| AUC-ROC | | | | | |

### Entrenamiento

- **Final Train Loss:** 
- **Final Val Loss:** 
- **Best Epoch:** 
- **Tiempo por epoch:** 
- **Tiempo total:** 

### Recursos

- **Hardware:** CPU / GPU (especificar)
- **Memoria utilizada:** 
- **Consumo energético:** (si disponible)

## Artefactos

- **Modelo:** `models/exp_{{date:YYYYMMDD}}_001/model.pkl`
- **Checkpoints:** `models/exp_{{date:YYYYMMDD}}_001/best.pt`
- **Logs:** `logs/exp_{{date:YYYYMMDD}}_001/`
- **Config:** `configs/exp_{{date:YYYYMMDD}}_001.yaml`
- **Predicciones:** `outputs/exp_{{date:YYYYMMDD}}_001/predictions.csv`

## Análisis

### Curvas de Entrenamiento

[Insertar o referenciar figuras]
- [Ver Figura - Training Curves]
- [Ver Figura - Validation Curves]

### Confusion Matrix

[Insertar o referenciar]
- [Ver Figura - Confusion Matrix]

### Feature Importance (si aplica)

| Feature | Importancia |
|---------|-------------|
| feat1 | X.XX |
| feat2 | X.XX |

### Análisis de Errores

- **Falsos Positivos:** X% - Patrón observado
- **Falsos Negativos:** X% - Patrón observado
- **Casos problemáticos:** Descripción

## Conclusiones

1. **Hallazgo principal 1:** Descripción (1-2 líneas)
2. **Hallazgo principal 2:** Descripción (1-2 líneas)
3. **Hallazgo principal 3:** Descripción (1-2 líneas)

## Próximos Pasos

- [ ] Experimento 1: Variar hiperparámetro X
- [ ] Experimento 2: Probar arquitectura Y
- [ ] Análisis: Investigar errores en clase Z

## Comparación

### vs Baseline

[Comparación con modelo anterior o baseline simple]

### vs Otros Experimentos

- [[Experimento - Anterior]]
- [[Experimento - Variante A]]

## Referencias

- [[Dataset utilizado]]
- [[Paper de referencia]]
- [[Método aplicado]]
- [[Implementación del modelo]]

---
*Experimento iniciado: {{date:YYYY-MM-DD}}*
