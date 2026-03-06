# Setup Guide - TEMPLATE_CODE Vault

Guía paso a paso para configurar este vault template para tu proyecto.

---

## Paso 1: Copiar el Template

1. **Copia** esta carpeta `TEMPLATE_CODE` a tu ubicación deseada:
   ```powershell
   Copy-Item -Recurse "D:\WSL-Projects\TEMPLATE_CODE" "D:\WSL-Projects\MiProyecto"
   ```

2. **Renombra** si es necesario (opcional):
   ```powershell
   Rename-Item "D:\WSL-Projects\TEMPLATE_CODE" "MiProyectoVault"
   ```

---

## Paso 2: Configurar AGENTS.md

Edita `AGENTS.md` y reemplaza:

| Placeholder | Valor a poner |
|-------------|---------------|
| `PROJECT_NAME` | Nombre de tu proyecto |
| `PROJECT_FOLDER` | Nombre de la carpeta del repo |
| Stack específico | Django, React, Vue, etc. |
| Arquitectura | Clean, Hexagonal, etc. |

**Ejemplo:**
```markdown
## Propósito
Este vault es el **Second Brain** del proyecto [[Mi API REST]]

**Location del Repo:** `D:\WSL-Projects\mi-api-rest`

**Stack:** Django 5 + DRF + PostgreSQL + Vue.js 3
```

---

## Paso 3: Configurar CLAUDE.md (o similar)

Edita `CLAUDE.md` con información específica:

### Para Desarrollo:
- Descripción del proyecto
- Comandos de build/test/lint
- Estructura de carpetas del código
- Convenciones de código
- Checklist de features

### Para Investigación:
- Pregunta de investigación
- Estado del arte
- Metodología
- Fuentes principales
- Experimentos planeados

---

## Paso 4: Elegir MOCs Relevantes

### Proyecto de Desarrollo:
Mantén estos MOCs:
- ✅ Start Here.md
- ✅ Implementation Progress.md
- ✅ Architecture Decisions.md
- ✅ TODOs del Proyecto.md
- ❌ Elimina: Research Progress.md

Considera añadir:
- Testing Strategy.md
- API Documentation.md
- Security & Privacy.md
- Deployment & DevOps.md

### Proyecto de Investigación:
Mantén estos MOCs:
- ✅ Start Here.md
- ✅ Research Progress.md
- ✅ TODOs del Proyecto.md
- ❌ Elimina: Implementation Progress.md, Architecture Decisions.md

Considera añadir:
- Literature Review.md
- Methodology.md
- Experiments.md
- Findings.md
- Publications.md

---

## Paso 5: Configurar IDE

### Claude Code

Crea `CLAUDE.md` en la raíz de tu repo de código:

```markdown
# CLAUDE.md

## Obsidian Vault
**Location:** `D:\WSL-Projects\MiProyecto\vault`

[Copia el resto del CLAUDE.md del vault aquí]
```

### GitHub Copilot

Crea `.github/copilot-instructions.md`:

```markdown
# Copilot Instructions

## Knowledge Base
Obsidian vault at: `D:\WSL-Projects\MiProyecto\vault`

[Ver ide-configs/github-copilot.md para template completo]
```

### OpenCode

Crea `.opencode/instructions.md`:

```markdown
# OpenCode Instructions

## Project Knowledge
Vault location: `D:\WSL-Projects\MiProyecto\vault`

[Ver ide-configs/opencode.md para template completo]
```

### Kimi CLI

El skill ya está instalado. Solo actualiza la ruta en:
`C:\Users\[user]\.config\agents\skills\obsidian-vault-querier\SKILL.md`

---

## Paso 6: Abrir en Obsidian

1. Abre Obsidian
2. "Open folder as vault"
3. Selecciona tu carpeta del vault
4. Configura Daily Notes (ya está en `.obsidian/daily-notes.json`)
5. Configura Templates (ya está en `.obsidian/templates.json`)

---

## Paso 7: Primeras Notas

1. **Crea tu primera Daily Note:**
   - `Ctrl+P` → "Open today's daily note"
   - Completa las secciones

2. **Crea un Topic de ejemplo:**
   - New note en `Topics/`
   - Usa template `Topic.md`
   - Ejemplo: `Concepto Principal.md`

3. **Actualiza Start Here:**
   - Añade links a tus MOCs principales
   - Personaliza el contenido

---

## Paso 8: Integrar con Repo

### Estructura Recomendada

```
D:\WSL-Projects\MiProyecto\
├── src/                    # Código fuente
├── tests/                  # Tests
├── docs/                   # Documentación generada
├── vault/                  # ← Este vault
│   ├── Topics/
│   ├── MOCs/
│   └── ...
├── CLAUDE.md              # ← Guía del repo
└── README.md
```

### Git (Opcional)

Incluir vault en el repo:
```bash
# En .gitignore del repo principal
# NO ignorar el vault si quieres versionarlo
# O ignorar solo cache:
vault/.obsidian/workspace
vault/.obsidian/cache
```

O mantener separado:
```bash
# Repo de código en GitHub
# Vault en Obsidian Sync o Git separado
```

---

## Paso 9: Flujo de Trabajo

### Daily Workflow

1. **Mañana:** Abre Daily Note, define Today's Focus
2. **Durante el día:** Toma notas en Daily Note, crea Topics
3. **Al cerrar feature:**
   - Actualiza Implementation/Research Progress
   - Crea ADR si fue decisión arquitectónica
   - Commit en repo con referencia al vault

### Weekly Review

1. Revisa Daily Notes de la semana
2. Actualiza MOCs con nuevos links
3. Organiza Topics (si hay muchos, crea MOCs)
4. Verifica TODOs pendientes

---

## Paso 10: Personalización Avanzada

### Plugins Recomendados (Obsidian)

1. **Dataview** - Queries dinámicas
   ```dataview
   TABLE status, created
   FROM #topic
   WHERE status = "developing"
   ```

2. **Templater** - Templates dinámicos
   - Fechas automáticas
   - Variables complejas

3. **Git** - Sync con Git
   - Backup automático
   - Historial de cambios

4. **Graph Analysis** - Análisis de grafos
   - Detectar notas huérfanas
   - Métricas de conectividad

### Temas

Recomendados para desarrollo:
- **Minimal** - Limpio y rápido
- **Cybertron** - Para el sistema cyberpunk de colores
- **Things** - Buena legibilidad

### Atajos de Teclado Personalizados

Edita `.obsidian/hotkeys.json`:

```json
{
  "daily-notes": "Ctrl+Shift+D",
  "graph:open-local": "Ctrl+Shift+G",
  "templates:insert-template": "Ctrl+T"
}
```

---

## Verificación

Después de la configuración, verifica:

- [ ] AGENTS.md tiene tu nombre de proyecto
- [ ] CLAUDE.md tiene info específica del proyecto
- [ ] IDE configurado (Claude/Copilot/OpenCode/Kimi)
- [ ] Vault abre correctamente en Obsidian
- [ ] Daily Notes funciona
- [ ] Templates cargan correctamente
- [ ] Primer Topic creado
- [ ] MOCs relevantes creados
- [ ] Integración repo-vault funcionando

---

## Troubleshooting

### Obsidian no reconoce el vault
- Verifica que `.obsidian/` exista
- Reinstala el app.json si está corrupto

### Templates no funcionan
- Verifica `.obsidian/templates.json` apunta a `Templates/`
- Usa `Ctrl+P` → "Insert template"

### Daily Notes no se crean
- Verifica `.obsidian/daily-notes.json`
- Asegúrate que la carpeta `Daily Notes/` existe

### Colores del grafo no funcionan
- Verifica `.obsidian/graph.json`
- Los colores se asignan por tags

---

## Recursos Adicionales

- **Obsidian Help:** https://help.obsidian.md/
- **Zettelkasten:** https://zettelkasten.de/
- **PARA Method:** https://fortelabs.com/blog/para/

---

**Setup completado!** 🎉

Ahora puedes empezar a usar tu vault productivamente.
