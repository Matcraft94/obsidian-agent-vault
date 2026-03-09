---
title: Methodology Validator
description: Valida metodologías científicas, diseños experimentales, supuestos metodológicos y buenas prácticas de investigación
triggers:
  - validar metodología
  - revisar diseño experimental
  - methodology check
  - experimental design
  - validar método
  - "validate methodology"
  - "check methodology"
  - "review design"
  - "experimental validation"
  "methodology review"
category: research
---

# Methodology Validator Skill

## Propósito

Validar metodologías científicas y diseños experimentales:
- Verificar validez interna/externa
- Comprobar supuestos metodológicos
- Identificar sesgos potenciales
- Sugerir mejoras metodológicas
- Asegurar reproducibilidad

## Triggers de Activación (10+)

### Validación
1. "validar metodología"
2. "methodology check"
3. "validate methodology"
4. "check methodology"

### Diseño Experimental
5. "revisar diseño experimental"
6. "experimental design"
7. "review design"
8. "experimental validation"

### Métodos
9. "validar método"
10. "methodology review"
11. "method validation"

## Dimensiones de Validación

### 1. Validez Interna

**Definición:** El grado en que los resultados son debidos a la variable independiente y no a otras causas.

**Aspectos a verificar:**
- Control de variables confusas
- Aleatorización adecuada
- Blind/double-blind cuando aplica
- Tamaño de muestra suficiente
- Poder estadístico (>0.80)

### 2. Validez Externa

**Definición:** Generalizabilidad de los resultados.

**Aspectos a verificar:**
- Representatividad de la muestra
- Contexto de aplicación
- Población objetivo
- Validez ecológica

### 3. Confiabilidad

**Aspectos a verificar:**
- Consistencia de mediciones
- Test-retest reliability
- Inter-rater reliability
- Cronbach's alpha (escalas)

### 4. Validez de Constructo

**Aspectos a verificar:**
- Definición operacional clara
- Convergent validity
- Discriminant validity
- Face validity

### 5. Supuestos Estadísticos

**Verificar para cada análisis:**
- Normalidad (Shapiro-Wilk, Kolmogorov-Smirnov)
- Homocedasticidad (Levene's test)
- Independencia de observaciones
- Linealidad (para regresión)
- Multicolinealidad (VIF < 10)

### 6. Diseño Experimental

**Tipos de diseño:**
- Pre-experimental
- Cuasi-experimental
- Experimental verdadero

**Elementos a verificar:**
- Grupos de control
- Pre-test/post-test
- Aleatorización
- Contrabalanceo

## Checklist de Validación

```markdown
# Validación Metodológica - [Estudio]

## Información General
- **Estudio:** Nombre
- **Fecha:** YYYY-MM-DD
- **Validador:** Nombre

## 1. Validez Interna

### Control de Variables Confusas
- [ ] Variables confusas identificadas
- [ ] Estrategia de control definida
- [ ] Variables de confusión documentadas

### Aleatorización
- [ ] Método de aleatorización descrito
- [ ] Seed/documentación de aleatorización
- [ ] Balance de grupos verificado

### Tamaño de Muestra
- [ ] Cálculo de poder estadístico reportado
- [ ] Nivel de significancia (α = 0.05)
- [ ] Poder alcanzado (1-β ≥ 0.80)
- [ ] Tamaño de efecto esperado justificado

**Veredicto:** ✅ Válido / ⚠️ Dudoso / ❌ Inválido

## 2. Validez Externa

### Muestra
- [ ] Muestra representativa de población objetivo
- [ ] Criterios de inclusión/exclusión claros
- [ ] Tasa de respuesta/reportada

### Generalización
- [ ] Contexto de aplicación descrito
- [ ] Limitaciones de generalización identificadas
- [ ] Poblaciones a las que aplica especificadas

**Veredicto:** ✅ Válido / ⚠️ Dudoso / ❌ Inválido

## 3. Confiabilidad

### Mediciones
- [ ] Instrumentos validados (si aplica)
- [ ] Consistencia intra-rater (si aplica)
- [ ] Consistencia inter-rater (si aplica)
- [ ] Estabilidad test-retest (si aplica)

**Veredicto:** ✅ Válido / ⚠️ Dudoso / ❌ Inválido

## 4. Validez de Constructo

### Definición Operacional
- [ ] Constructo definido claramente
- [ ] Variables operacionalizadas adecuadamente
- [ ] Relación teórica establecida

### Validación
- [ ] Convergent validity verificada
- [ ] Discriminant validity verificada
- [ ] Face validity documentada

**Veredicto:** ✅ Válido / ⚠️ Dudoso / ❌ Inválido

## 5. Supuestos Estadísticos

### Análisis: [Nombre del análisis]
- [ ] Normalidad: [Test usado, resultado]
- [ ] Homocedasticidad: [Test usado, resultado]
- [ ] Independencia: [Verificación]
- [ ] Linealidad: [Verificación]

**Veredicto:** ✅ Cumple / ⚠️ Parcial / ❌ No cumple

## 6. Diseño Experimental

### Tipo de Diseño
- [ ] Pre-experimental
- [ ] Cuasi-experimental
- [ ] Experimental verdadero

### Elementos
- [ ] Grupo control: [Sí/No/Describir]
- [ ] Pre-test: [Sí/No]
- [ ] Post-test: [Sí/No]
- [ ] Aleatorización: [Completa/Parcial/Ninguna]
- [ ] Blind: [Simple/Doble/Ninguna]

**Veredicto:** ✅ Adecuado / ⚠️ Mejorable / ❌ Inadecuado

## 7. Ética

- [ ] Aprobación ética (IRB/Ethics Committee)
- [ ] Consentimiento informado
- [ ] Confidencialidad protegida
- [ ] Riesgos vs beneficios evaluados

**Veredicto:** ✅ Cumple / ⚠️ Parcial / ❌ No cumple

## 8. Reproducibilidad

- [ ] Código disponible
- [ ] Datos documentados
- [ ] Procedimiento detallado
- [ ] Software/versión especificados

**Veredicto:** ✅ Completa / ⚠️ Parcial / ❌ Insuficiente

## Resumen de Hallazgos

### Fortalezas
1. 
2. 
3. 

### Debilidades
1. 
2. 
3. 

### Riesgos Metodológicos
| Riesgo | Severidad | Mitigación |
|--------|-----------|------------|
| | Alta/Media/Baja | |

## Recomendaciones

### Alta Prioridad
- [ ] 

### Media Prioridad
- [ ] 

### Baja Prioridad
- [ ] 

## Veredicto Final

**Estado:** ✅ Aprobado / ⚠️ Aprobado con reservas / ❌ Rechazado

**Justificación:**

## Referencias

- [[Estudio validado]]
- [[Método aplicado]]
- [[Análisis estadístico]]
```

## Sistema de Severidad

| Severidad | Descripción | Acción |
|-----------|-------------|--------|
| **Alta** | Invalida conclusiones | Corregir antes de continuar |
| **Media** | Debilita conclusiones | Corregir si es posible |
| **Baja** | Menor impacto | Documentar limitación |

## Integración con Otros Skills

- Para análisis estadístico → Usar `stats-reviewer`
- Para dataset → Usar `data-explorer`
- Para documentar → Usar `vault-writer`
- Para commitear → Usar `vault-commit`

## Ejemplo de Uso

**Usuario**: "Valida este diseño experimental"

**Flujo**:
1. Revisar documentación del estudio
2. Evaluar cada dimensión de validez
3. Identificar sesgos y riesgos
4. Generar checklist completado
5. Proporcionar recomendaciones
6. Crear nota de validación
7. Commitear cambios
