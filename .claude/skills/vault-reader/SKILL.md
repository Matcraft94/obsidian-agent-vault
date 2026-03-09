---
title: Vault Reader
description: Consulta el vault de documentación antes de leer código o responder preguntas sobre el proyecto
required_context:
  - vault_path
  - project_name
triggers:
  - preguntas sobre TODOs
  - preguntas sobre estado del proyecto
  - preguntas sobre fases o roadmap
  - preguntas sobre decisiones arquitectónicas
  - preguntas sobre implementación actual
  - preguntas sobre problemas conocidos
  - preguntas sobre temas técnicos
  - preguntas sobre testing
  - preguntas sobre bugs
  - preguntas sobre configuración
  - preguntas sobre requisitos
  - "¿qué estamos haciendo?"
  - "¿dónde estamos?"
  - "¿qué falta?"
  - "¿cuál es el estado?"
  - "¿hay algún TODO?"
  - "¿qué fase?"
  - "¿cómo funciona X?"
  - "¿por qué se decidió Y?"
  - "explain X"
  - "what about Y"
category: documentation
---

# Vault Reader Skill

## Propósito

**SIEMPRE consultar el vault ANTES de leer código.**

Este skill garantiza que cualquier pregunta sobre el proyecto se responda consultando primero la documentación del vault, no adivinando ni leyendo código directamente.

## Jerarquía de Consulta

Cuando el usuario hace una pregunta sobre el proyecto, seguir este orden:

| Orden | Ubicación | Qué buscar | Ejemplo |
|-------|-----------|------------|---------|
| 1 | `Implementation Progress.md` | Estado actual, % completado, fase activa | "Fase 3 - 75% completada" |
| 2 | `MOCs/Proyecto - TODOs.md` | Tareas pendientes, prioridades | "TODOs de la semana" |
| 3 | `ADRs/` | Decisiones arquitectónicas | "Por qué PostgreSQL vs Mongo" |
| 4 | `MOCs/Fase X - *.md` | Detalles de fases específicas | "Fase 3 - Domain y Services" |
| 5 | `Topics/` | Temas técnicos específicos | "Arquitectura - Clean Architecture" |
| 6 | `Daily Notes/` | Contexto de sesiones recientes | "2026-03-08.md" |

## Convenciones de Nombres del Vault

### MOCs (Map of Content)
- **Fases**: `Fase X - Nombre Descriptivo.md`
- **Pasos**: `Paso X.Y - Nombre Descriptivo.md` (X=phase, Y=step)
- **Especiales**: `Proyecto - TODOs.md`, `Proyecto - Roadmap.md`

### Topics
- **Formato**: `Categoria - Nombre.md`
- **Categorías Software**: Arquitectura, BD, Testing, Seguridad, API, Frontend, Backend, Negocio, DevOps, Proyecto, Doc, Herramienta
- **Categorías Investigación**: Matemática, Algoritmo, Software, Concepto, Bibliografía, Implementación, Dataset, Método, Teoría, Aplicación, Paper, Figura, Análisis, Modelo, Métrica, Proceso, Resultado, Caso, Experimento, Visualización
- **Ejemplos Software**:
  - `Arquitectura - Clean Architecture.md`
  - `BD - PostgreSQL.md`
  - `Testing - E2E Suite.md`
- **Ejemplos Investigación**:
  - `Matemática - Álgebra Lineal.md`
  - `Paper - LeCun 2015 Deep Learning.md`
  - `Dataset - MNIST.md`
- **Ejemplos Investigación**:
  - `Matemática - Homología Persistente.md`
  - `Paper - Carlsson 2009 Topology and Data.md`
  - `Dataset - MNIST.md`

### ADRs
- **Formato**: `ADR-XXX Descripcion Breve.md`
- **Ejemplo**: `ADR-001 PostgreSQL vs MongoDB.md`

### Daily Notes
- **Índice**: `YYYY-MM-DD.md`
- **Detalle**: `YYYY-MM-DD - Descripcion.md`

## Reglas de Búsqueda

### ✅ HACER
- Usar `grep` para buscar contenido específico
- Usar `glob` para encontrar archivos por patrón
- Leer archivos individuales, nunca directorios completos
- Seguir wiki-links `[[...]]` para profundizar
- Verificar existencia de archivos antes de citarlos

### ❌ NO HACER
- Leer directorios completos con `ls` o `find`
- Ignorar prefijos categóricos en Topics/
- Saltarse el vault y leer código directamente
- Asumir que los archivos existen sin verificar
- Leer archivos grandes (>100 líneas) completos de una vez

## Ejemplo de Flujo de Consulta

**Usuario pregunta:** "¿Cuál es el estado actual del proyecto?"

1. **Buscar** `Implementation Progress.md` con grep
2. **Leer** las primeras 50 líneas del archivo
3. **Extraer**: Fase actual, % completado, próximos pasos
4. **Buscar** el MOC de la fase actual en `MOCs/`
5. **Responder** con bullets y wiki-links

## Formato de Respuesta

```markdown
## Estado Actual del Proyecto

- **Fase activa**: [[Fase 3 - Domain y Services]]
- **Progreso**: 75% completado
- **En progreso**:
  - [[Paso 3.2 - Value Objects]]
  - [[Paso 3.3 - Domain Services]]
- **Próximo**: [[Paso 3.4 - Application Services]]
- **Blockers**: Ninguno

### TODOs prioritarios
- Ver [[Proyecto - TODOs]] para lista completa
- 5 tareas críticas esta semana

### Documentación relevante
- [[ADR-001 PostgreSQL vs MongoDB]]
- [[Arquitectura - Clean Architecture]]
```

## Lista de Triggers (20+)

### Estado y Progreso
1. "¿qué estamos haciendo?"
2. "¿dónde estamos?"
3. "¿qué falta?"
4. "¿cuál es el estado?"
5. "¿en qué fase estamos?"
6. "¿cómo va el proyecto?"
7. "what is the current status"
8. "what phase are we in"

### TODOs y Tareas
9. "¿hay algún TODO?"
10. "¿qué tareas faltan?"
11. "¿qué hay pendiente?"
12. "show me the TODOs"
13. "what's on the todo list"

### Arquitectura y Decisiones
14. "¿por qué se decidió Y?"
15. "¿cuál es la arquitectura?"
16. "¿cómo funciona X?"
17. "explain the architecture"
18. "why was Z chosen"

### Técnicos
19. "¿cómo se implementa X?"
20. "¿dónde está definido Y?"
21. "what about the testing"
22. "how does the database work"

### Bugs y Problemas
23. "¿hay bugs conocidos?"
24. "¿qué problemas hay?"
25. "known issues"

## Notas Importantes

- **El vault es la fuente de verdad**: Siempre consultarlo primero
- **Wiki-links son obligatorios**: Usar `[[Nombre del Archivo]]` para referencias
- **Brevity**: Respuestas concisas, máximo 3-4 bullets por sección
- **Contexto**: Si no hay vault configurado, informar al usuario
