---
cssclass: figure-note
tags:
  - figure
  - tikz
  - visualization
type: diagram
status: draft
source_file: ""
output_file: ""
created: "{{date:YYYY-MM-DD}}"
modified: "{{date:YYYY-MM-DD}}"
---

# Figura: {{title}}

## Información

- **Tipo:** Diagrama / Gráfico / Superficie 3D / Ilustración
- **Estado:** Draft / Review / Final
- **Archivo fuente:** `figures/{{title}}.tex`
- **Archivo output:** `figures/{{title}}.pdf`
- **Dimensión:** 2D / 3D
- **Uso:** [[Paper/Sección donde se usa]]

## Descripción

Breve descripción de qué representa esta figura y su propósito.

## Código TikZ

```latex
% -- Figura: {{title}} --
\documentclass[border=2mm]{standalone}

% Input encoding
\usepackage[utf8]{inputenc}

% Math
\usepackage{amsmath}

% Colors
\usepackage[dvipsnames]{xcolor}

% Graphics
\usepackage{tikz}
\usepackage{tikz-3dplot}
\usepackage{pgfplots}
\pgfplotsset{compat=1.18}

% TikZ libraries
\usetikzlibrary{3d, math, arrows.meta, perspective}

% PGFPlots libraries
\usepgfplotslibrary{colormaps, colorbrewer}

% Custom colors
\definecolor{primary}{HTML}{1976d2}
\definecolor{secondary}{HTML}{388e3c}
\definecolor{accent}{HTML}{d32f2f}

\begin{document}
\begin{tikzpicture}
    % === CONTENIDO DE LA FIGURA ===
    
    % Ejemplo: Ejes 3D
    \tdplotsetmaincoords{70}{120}
    \begin{scope}[tdplot_main_coords]
        % Ejes
        \draw[->, thick] (0,0,0) -- (3,0,0) node[anchor=north east]{$x$};
        \draw[->, thick] (0,0,0) -- (0,3,0) node[anchor=north west]{$y$};
        \draw[->, thick] (0,0,0) -- (0,0,3) node[anchor=south]{$z$};
        
        % Contenido adicional
        \fill[primary] (1,1,1) circle (2pt);
    \end{scope}
    
    % === FIN CONTENIDO ===
\end{tikzpicture}
\end{document}
```

## Elementos Visuales

### Leyenda

| Elemento | Color | Significado |
|----------|-------|-------------|
| Punto A | primary (azul) | Descripción |
| Punto B | secondary (verde) | Descripción |
| Punto C | accent (rojo) | Descripción |

### Dimensiones

- **Ancho:** X cm
- **Alto:** Y cm
- **Escala:** Z

## Notas de Diseño

- Perspectiva usada: `\tdplotsetmaincoords{70}{120}`
- Colores coherentes con paleta del documento
- Fuente: Computer Modern (default LaTeX)
- Líneas principales: thick
- Líneas auxiliares: thin/dashed

## Compilación

```bash
# Compilar a PDF
pdflatex {{title}}.tex

# O con latexmk
latexmk -pdf {{title}}.tex

# Limpiar auxiliares
latexmk -c
```

## Integración en Documento Principal

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.8\textwidth]{figures/{{title}}}
    \caption{Leyenda descriptiva de la figura.}
    \label{fig:{{title}}}
\end{figure}
```

## Variantes

### Variante 1: [Nombre]

Diferencias con la versión principal:
- Cambio 1
- Cambio 2

### Variante 2: [Nombre]

Diferencias:
- Cambio 1
- Cambio 2

## Referencias

- [[Concepto representado]]
- [[Paper donde se inspira]]
- [[Figura relacionada]]

## Historial de Cambios

| Versión | Fecha | Cambios | Autor |
|---------|-------|---------|-------|
| 1.0 | {{date:YYYY-MM-DD}} | Versión inicial | |
| 1.1 | YYYY-MM-DD | Ajuste de colores | |

---
*Figura creada: {{date:YYYY-MM-DD}}*
