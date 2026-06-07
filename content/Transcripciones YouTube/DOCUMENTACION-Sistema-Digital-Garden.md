---
title: "📋 DOCUMENTACIÓN DEL SISTEMA — Digital Garden Sync"
tags:
  - documentación
  - sistema
  - digital-garden
  - sync
---

# 📋 DOCUMENTACIÓN DEL SISTEMA — Digital Garden Sync

> **Última actualización:** 2026-06-07
> **Estado:** Estable y funcionando

---

## 🔄 FLUJO COMPLETO

```
┌─────────────────┐     ┌──────────────────┐     ┌─────────────────────┐
│  Obsidian Vault │────▶│  GitHub zor-vault│────▶│  digital-garden-    │
│  (tu PC)        │     │  (remote)        │     │  dimanarzan         │
└─────────────────┘     └──────────────────┘     └─────────────────────┘
        │                        │                         │
        │ 1. Escribes/edicitas   │                         │
        │ 2. Commit + Push       │                         │
        │                        │ 3. Cron detecta cambios │
        │                        │ 4. Pull del vault       │
        │                        │ 5. Copia contenido      │
        │                        │ 6. Build Quartz         │
        │                        │ 7. Deploy gh-pages      │
        │                        │                         │ 8. Web actualizada
```

---

## 📁 ESTRUCTURA DE DIRECTORIOS

```
/opt/data/
├── obsidian-vault/              ← Clone de zor-vault (fuente de verdad)
│   ├── 📚 BANCOS/
│   ├── Copywriting/
│   ├── Transcripciones YouTube/
│   ├── 📓 NotebookLM/
│   └── ... (tu vault completo)
├── quartz-v5-fresh/             ← Quartz v5 + contenido symlink
│   ├── content/                 ← Copia del vault (excluyendo basura)
│   ├── quartz.config.yaml       ← Config del garden
│   ├── .quartz/                 ← Plugins de Quartz
│   ├── node_modules/            ← Dependencias
│   └── public/                  ← Build output
├── digital-garden-deploy/       ← Deploy temporal
├── digital-garden-workspace/    ← Config y scripts
│   └── quartz.config.yaml       ← Config maestro
└── home/
    └── scripts/
        └── sync-vault-to-garden.py  ← Script de sync
```

---

## ⚙️ CONFIGURACIÓN DE QUARTZ

**Archivo:** `/opt/data/quartz-v5-fresh/quartz.config.yaml`

### Configuración crítica:

```yaml
configuration:
  pageTitle: Dani Marzán — Digital Garden
  enableSPA: true
  locale: es-ES
  baseUrl: sleepingsmel.github.io/digital-garden-danimarzan
  
  # basePath se calcula automáticamente desde baseUrl
  # Para GitHub Pages, NO usar dominio personalizado
  # NO añadir archivo CNAME

  ignorePatterns:
    - private
    - templates
    - .obsidian

plugins:
  # Plugins esenciales habilitados:
  - content-index       # Búsqueda + RSS
  - explorer            # Navegador de archivos (sidebar izquierda)
  - search              # Barra de búsqueda
  - graph               # Vista grafo (sidebar derecha)
  - backlinks           # Retroenlaces (sidebar derecha)
  - article-title       # Títulos de artículo
  - page-title          # Títulos de página
  - content-meta        # Metadatos (fecha, tags)
  - darkmode            # Modo oscuro/claro
  - reader-mode         # Modo lector
  - breadcrumbs         # Migas de pan
  - description         # Descripciones OG
  - favicon             # Favicon
  - og-image            # Imágenes OG
  - note-properties     # Propiedades de notas
  - unlisted-pages      # Páginas no listadas

layout:
  groups:
    toolbar:
      priority: 35
      direction: row
```

### Plugins que deben estar HABILITADOS:

| Plugin | Razón |
|--------|-------|
| `explorer` | Navegador de archivos en sidebar |
| `search` | Búsqueda |
| `graph` | Grafo de conexiones |
| `backlinks` | Retroenlaces |
| `content-index` | Búsqueda + RSS |
| `article-title` | Títulos de páginas |
| `breadcrumb` | Navegación |
| `darkmode` | Modo oscuro |
| `reader-mode` | Modo lector |

### Plugins que deben estar DESHABILITADOS:

| Plugin | Razón |
|--------|-------|
| `cname` | NO usar — causa conflictos con GitHub Pages |
| `comments` | No necesario |

---

## 📝 ARCHIVOS QUE DEBEN EXISTIR

### En el vault (zor-vault):

1. **`index.md`** en la raíz del vault
   - **OBLIGATORIO:** Sin esto, Quartz no genera `index.html`
   - Debe tener frontmatter con `title: Inicio`

### Notas del vault:
- Todas las notas necesitan **YAML frontmatter** con `title:`
- Formato: `---\ntitle: Nombre\n---\n`

---

## 🚫 ERRORES PASADOS Y SOLUCIONES

### Error 1: "index.html no existe en GitHub Pages"
**Causa:** No había `index.md` en el content de Quartz.
**Consecuencia:** GitHub Pages servía el RSS feed (XML) en vez de HTML.
**Solución:** Crear `/opt/data/quartz-v5-fresh/content/index.md` con frontmatter.

### Error 2: "CNAME file causa conflicto"
**Causa:** Un deploy anterior subió archivo `CNAME` que apuntaba a Vercel.
**Consecuencia:** GitHub Pages resolvía al dominio de Vercel en vez del dominio `github.io`.
**Solución:** Eliminar el archivo CNAME del deploy.

### Error 3: "Duplicated mapping key"
**Causa:** Archivos con YAML frontmatter mal formado (keys duplicadas).
**Consecuencia:** Quartz falla al parsear y el build falla.
**Solución:** Excluir archivos/carpetas problemáticas en el sync script.

### Error 4: "SHUTIL ignora archivos"
**Causa:** `shutil.copytree` no sobrescribe archivos existentes correctamente.
**Consecuencia:** Archivos antiguos quedaban en el content.
**Solución:** Antes de copiar, BORRAR el destino si existe:
```python
if os.path.exists(dst):
    shutil.rmtree(dst)
shutil.copytree(src, dst, ...)
```

### Error 5: "Content no sincronizado"
**Causa:** El script no borraba archivos eliminados del vault.
**Consecuencia:** Archivos borrados seguían apareciendo en la web.
**Solución:** El script ahora BORRA y RE-CREA cada vez (no incremental).

---

## 🔒 REGLAS DE ORO PARA EVITAR ERRORES

### 1. NUNCA subir archivo CNAME
```bash
# Verificar que NO existe
ls /opt/data/digital-garden-deploy/CNAME 2>/dev/null && echo "PROBLEMA" || echo "OK"
```

### 2. SIEMPRE verificar index.html
```bash
# Después de cada deploy
curl -sL -w "%{http_code}" "https://sleepingsmel.github.io/digital-garden-danimarzan/" | grep -E "<title>|HTTP:"
# Debe devolver HTTP 200 con <title>Inicio</title>
```

### 3. Limpiar antes de copiar
```python
# En el sync: BORRAR destino ANTES de copiar
if os.path.exists(dst):
    shutil.rmtree(dst)
shutil.copytree(src, dst, ...)
```

### 4. Verificar frontmatter de notas nuevas
```python
# Todas las notas .md necesitan:
# ---
# title: Nombre
# ---
```

### 5. Config baseUrl correcta
```yaml
# CORRECTO:
baseUrl: sleepingsmel.github.io/digital-garden-danimarzan

# INCORRECTO (causa errores):
baseUrl: quartz-vault-danimarzan.vercel.app
baseUrl: sleepingsmel.github.io/quartz-vault-danimarzan
```

---

## 📋 CHECKLIST DEPLOY

Antes de cada deploy, verificar:

- [ ] `index.md` existe en `/opt/data/quartz-v5-fresh/content/`
- [ ] No hay archivo `CNAME` en el deploy
- [ ] `quartz.config.yaml` tiene `baseUrl` correcta
- [ ] El contenido se copia limpio (borrar antes de copiar)
- [ ] Build de Quartz exitoso (Parsed > 0)
- [ ] `index.html` existe en `public/`
- [ ] `git push` exitoso
- [ ] Web carga correctamente (HTTP 200)

---

## 🛠️ SCRIPTS DISPONIBLES

### `/opt/data/home/scripts/sync-vault-to-garden.py`
Script principal de sincronización. Se ejecuta cada 30 min vía cron.

**Uso manual:**
```bash
python3 /opt/data/home/scripts/sync-vault-to-garden.py
```

**Salida esperada:**
```
[2026-06-07 19:34:58] === SYNC START ===
[2026-06-07 19:34:59] Pulling zor-vault...
[2026-06-07 19:34:59] No changes — skipping build
[2026-06-07 19:34:59] Synced 35 items
[2026-06-07 19:34:59] Building Quartz...
[2026-06-07 19:36:06] Parsed 205 Markdown files
[2026-06-07 19:36:06] Emitted 735 files
[2026-06-07 19:36:06] Done processing 205 files in 1m
[2026-06-07 19:36:12] DEPLOY SUCCESS ✓
[2026-06-07 19:36:12] === SYNC END ===
```

---

## 📊 CRON JOBS RELACIONADOS

| Job | Schedule | Descripción |
|-----|----------|-------------|
| Sync Vault → Garden | `*/30 * * * *` | Sincroniza vault cada 30 min |

---

## 🔧 MANTENIMIENTO

### Después de un reboot del servidor:

El directorio `/tmp/quartz-v5-fresh` se borra. El script detecta esto y sale sin hacer nada. Para restaurar:

```bash
# 1. Clonar Quartz v5
cd /tmp
git clone --depth 1 --branch v5 https://github.com/jackyzha0/quartz.git quartz-v5-fresh

# 2. Instalar dependencias
cd quartz-v5-fresh
npm install

# 3. Copiar .quartz plugins
cp -r /tmp/quartz-v5/.quartz . 2>/dev/null || echo "Necesita setup manual"

# 4. Ejecutar sync
python3 /opt/data/home/scripts/sync-vault-to-garden.py
```

### Limpieza de archivos temporales:

```bash
# Borrar deploy temporal
rm -rf /opt/data/digital-garden-deploy

# Borrar cache de Quartz
rm -rf /tmp/quartz-v5-fresh/.quartz-cache
```

---

## 📞 CONTACTO

Si el sistema falla:
1. Verificar que `quartz-v5-fresh` existe: `ls /tmp/quartz-v5-fresh/package.json`
2. Verificar que `node_modules` existe: `ls /tmp/quartz-v5-fresh/node_modules/.bin/quartz`
3. Verificar que `.quartz` existe: `ls /tmp/quartz-v5-fresh/.quartz/plugins/`
4. Ejecutar sync manual: `python3 /opt/data/home/scripts/sync-vault-to-garden.py`
5. Verificar web: `curl -sL -w "%{http_code}" "https://sleepingsmel.github.io/digital-garden-danimarzan/"`

---

*Mantenido por Zor — Última actualización: 2026-06-07*
