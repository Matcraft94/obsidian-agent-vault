---
title: LaTeX TikZ Generator
description: Genera figuras científicas en TikZ/PGF siguiendo las mejores prácticas del curso de dibujo 3D con LaTeX
triggers:
  - crear figura tikz
  - generar visualización latex
  - tikz figure
  - pgfplots
  - diagrama latex
  - "create tikz"
  - "generate figure"
  - "latex visualization"
  - "tikz diagram"
  - "pgf figure"
category: visualization
---

# LaTeX TikZ Generator Skill

## Propósito

Generar figuras científicas de alta calidad usando TikZ, tikz-3dplot y PGFPlots siguiendo las mejores prácticas del curso de dibujo 3D.

## Triggers de Activación (10+)

### Creación de Figuras
1. "crear figura tikz"
2. "generar visualización latex"
3. "create tikz"
4. "generate figure"

### Tipos Específicos
5. "diagrama de persistencia"
6. "diagrama conmutativo"
7. "superficie 3d"
8. "grafico cientifico"

### Comandos
9. "tikz diagram"
10. "pgfplots figure"
11. "latex visualization"
12. "tikz figure"

## Stack Tecnológico

### Paquetes Principales
- `tikz` - Core graphics
- `tikz-3dplot` - Transformaciones 3D
- `pgfplots` - Gráficos avanzados y superficies 3D
- `xcolor` (dvipsnames) - Colores extendidos
- `amsmath` - Notación matemática

### Librerías TikZ
- `3d` - Operaciones 3D
- `math` - Definición de funciones matemáticas
- `arrows.meta` - Puntas de flecha avanzadas
- `perspective` - Dibujo en perspectiva
- `cd` - Diagramas conmutativos

### Librerías PGFPlots
- `colormaps` - Mapeo de colores
- `colorbrewer` - Paletas Brewer

## Convenciones de Código

### 1. Estructura del Documento

```latex
% -- Tipo de Figura: Descripción --
\documentclass[border=1mm]{standalone}

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

% Custom colors (HTML codes)
\definecolor{myBlue1}{HTML}{0d47a1}
\definecolor{myRed1}{HTML}{b71c1c}

\begin{document}
\begin{tikzpicture}
    % Content
\end{tikzpicture}
\end{document}
```

### 2. Sistema de Coordenadas 3D

```latex
% Definir perspectiva PRIMERO
\tdplotsetmaincoords{70}{120}

% Aplicar a scope
\begin{scope}[tdplot_main_coords]
    % Drawing commands
\end{scope}
```

**Ángulos comunes:**
- `{70}{120}` - Vista isométrica estándar
- `{60}{110}` - Vista más frontal
- `{80}{130}` - Vista más superior

### 3. Definición de Variables

```latex
\tikzmath{
    \r = 2;          % Radio
    \xmax = 4;       % Máximo X
    \ymax = 4;       % Máximo Y
    \zmax = 4;       % Máximo Z
    \theta = 45;     % Ángulo theta
}
```

### 4. Proyecciones en Planos

```latex
% Plano XY en z=0
\begin{scope}[canvas is xy plane at z=0]
    \draw[fill=blue, opacity=0.3] (0,0) rectangle (2,2);
\end{scope}

% Plano XZ en y=0
\begin{scope}[canvas is xz plane at y=0]
    \draw[dashed] (0,0) -- (2,2);
\end{scope}

% Plano YZ en x=0
\begin{scope}[canvas is yz plane at x=0]
    \draw[dashed] (0,0) -- (2,2);
\end{scope}
```

### 5. Coordenadas Esféricas

```latex
\coordinate (P) at (xyz spherical cs:
    radius=\r,
    latitude={90 - \theta},
    longitude={90 - \phi}
);
```

### 6. PGFPlots 3D

```latex
\begin{axis}[
    width=8cm,
    height=8cm,
    view={70}{30},
    colormap/viridis,
    xlabel=$x$,
    ylabel=$y$,
    zlabel=$z$,
]
\addplot3[
    surf,
    z buffer=sort,  % SIEMPRE para superficies complejas
    shader=interp,
    domain=-2:2,
    domain y=-2:2,
] {x^2 + y^2};
\end{axis}
```

## Tipos de Figuras Soportadas

### 1. Diagramas de Persistencia

```latex
\begin{tikzpicture}[scale=0.8]
    % Diagonal
    \draw[dashed, gray] (0,0) -- (5,5);
    
    % Puntos de persistencia
    \fill[myBlue1] (0.5, 2) circle (3pt);
    \fill[myBlue1] (1, 3) circle (3pt);
    \fill[myRed1] (0.3, 4) circle (3pt);
    
    % Ejes
    \draw[->] (0,0) -- (5.5,0) node[right] {$\text{birth}$};
    \draw[->] (0,0) -- (0,5.5) node[above] {$\text{death}$};
\end{tikzpicture}
```

### 2. Diagramas Conmutativos

```latex
\begin{tikzcd}
    A \arrow[r, "f"] \arrow[d, "g"'] & B \arrow[d, "h"] \\
    C \arrow[r, "k"'] & D
\end{tikzcd}
```

### 3. Complejos Simpliciales

```latex
\begin{tikzpicture}
    % Vértices
    \coordinate (A) at (0,0);
    \coordinate (B) at (2,0);
    \coordinate (C) at (1,1.5);
    
    % Aristas
    \draw[thick] (A) -- (B) -- (C) -- cycle;
    
    % Relleno
    \fill[blue, opacity=0.3] (A) -- (B) -- (C) -- cycle;
    
    % Vértices
    \fill (A) circle (2pt) node[below] {$v_0$};
    \fill (B) circle (2pt) node[below] {$v_1$};
    \fill (C) circle (2pt) node[above] {$v_2$};
\end{tikzpicture}
```

### 4. Gráficos de Barras (Barcodes)

```latex
\begin{tikzpicture}[scale=0.8]
    % Ejes
    \draw[->] (0,0) -- (6,0) node[right] {$\epsilon$};
    \draw[->] (0,0) -- (0,4) node[above] {$H_k$};
    
    % Barras
    \draw[line width=3pt, myBlue1] (0,1) -- (3,1);
    \draw[line width=3pt, myRed1] (0,2) -- (5,2);
    \draw[line width=3pt, myBlue1] (1,3) -- (4,3);
\end{tikzpicture}
```

### 5. Superficies 3D

```latex
\begin{tikzpicture}
\begin{axis}[
    view={70}{30},
    colormap/viridis,
]
\addplot3[
    surf,
    z buffer=sort,
    domain=-3:3,
    domain y=-3:3,
] {sin(deg(x)) * cos(deg(y))};
\end{axis}
\end{tikzpicture}
```

## Best Practices

### Z-Buffer Sorting
Para superficies complejas, SIEMPRE usar:
```latex
\addplot3[surf, z buffer=sort, ...]
```

### Hidden Surface Removal
Usar opacidad para caras transparentes:
```latex
\fill[Blue, opacity=0.25] ...
```

### Orden de Transformaciones
El orden importa en transformaciones 3D:
```latex
\begin{scope}[
    shift={(0,0,3)},        % Aplicado segundo
    rotate around x=-40,    % Aplicado primero
]
```

### Colores Consistentes
Definir paleta al inicio:
```latex
\definecolor{primary}{HTML}{1976d2}
\definecolor{secondary}{HTML}{388e3c}
\definecolor{accent}{HTML}{d32f2f}
```

## Integración con Vault

Las figuras generadas deben:
1. Guardarse en carpeta `Figures/` o integrarse en notas
2. Referenciarse desde topics con `[[Figura - Nombre]]`
3. Incluir descripción en nota de tipo Figura

## Ejemplo de Uso

**Usuario**: "Crea un diagrama de persistencia para H1"

**Output**:
1. Código TikZ completo
2. Explicación de componentes
3. Instrucciones de compilación
4. Sugerencia de cómo integrar en monografía
