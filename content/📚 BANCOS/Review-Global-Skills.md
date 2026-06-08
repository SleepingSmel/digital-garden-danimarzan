---
title: 🔍 REVIEW GLOBAL DE SKILLS — Análisis y Recomendaciones
tags:
  - review
  - skills
  - limpieza
  - optimización
modified: 2026-06-07T20:38:53
created: 2026-06-07T20:38:53
---

# 🔍 REVIEW GLOBAL DE SKILLS — Análisis y Recomendaciones

> **Fecha:** 2026-06-07
> **Total skills:** 181
> **Categorías:** 22

---

## RESUMEN EJECUTIVO

| Categoría | Skills | Estado |
|-----------|--------|--------|
| **creative** | 45 | ⚠️ Muy redundante — 15+ skills de vídeo/Remotion que se solapan |
| **system** | 30 | ⚠️ Varias duplicadas (script-system, script-workflow, script-feedback) |
| **mlops** | 22 | ✅ Especializadas, no duplicadas |
| **research** | 7 | ✅ Bien diferenciadas |
| **software-development** | 12 | ✅ Bien diferenciadas |
| **productivity** | 9 | ✅ Útiles, no duplicadas |
| **media** | 6 | ✅ Bien diferenciadas |
| **github** | 5 | ✅ Bien diferenciadas |
| **remotion-video-production** | 5 | ⚠️ Solapadas con creative |
| **file-search-and-obsidian-organization** | 2 | ⚠️ Duplicadas |
| **b2b-outreach** | 2 | ⚠️ Duplicadas |
| **autonomous-ai-agents** | 5 | ✅ Útiles |
| **data-science** | 2 | ✅ |
| **devops** | 3 | ✅ |
| **email** | 1 | ✅ |
| **gaming** | 2 | ✅ |
| **leisure** | 1 | ✅ |
| **mcp** | 2 | ✅ |
| **note-taking** | 1 | ✅ |
| **red-teaming** | 1 | ✅ |
| **smart-home** | 1 | ✅ |
| **social-media** | 2 | ✅ |

---

## 🔴 SKILLS DUPLICADAS / REDUNDANTES (Eliminar o Fusionar)

### 1. SISTEMA DE GUIONES (3 → 1)

**Problema:** Tres skills que hacen lo mismo con nombres diferentes:

| Skill | Descripción | Solución |
|-------|-------------|----------|
| `dani-marzana-script-system-v3` | Sistema de generación de guiones V3 | **MANTENER** — la más completa |
| `dani-marzana-script-workflow` | Flujo de trabajo para crear guiones | **ELIMINAR** — subset de V3 |
| `dani-marzana-script-feedback` | Cómo dar feedback de guiones | **FUSIONAR** en V3 como sección |

**Acción:** Fusionar `script-feedback` y `script-workflow` dentro de `script-system-v3`. Eliminar las dos skills independientes.

---

### 2. VIDEO PIPELINE (8 → 2)

**Problema:** Ocho skills de vídeo/Remotion que se solapan enormemente:

| Skill | Descripción | Solución |
|-------|-------------|----------|
| `short-video-pipeline` | Pipeline V3 integrado (598 líneas) | **MANTENER** — el más completo |
| `video-production-definitivo` | Producción V4 definitiva | **FUSIONAR** en short-video-pipeline |
| `video-pipeline-definitivo` | Instrucciones definitivas vídeo | **FUSIONAR** en short-video-pipeline |
| `video-pipeline-checklist` | Checklist end-to-end | **FUSIONAR** como sección del pipeline |
| `shorts-production-v2` | Lecciones de 5 iteraciones | **FUSIONAR** como sección de pitfalls |
| `shorts-batch-production` | Pipeline para batches de 10+ | **FUSIONAR** como sección |
| `remotion-video-instructions` | Master instructions Remotion | **FUSIONAR** como referencia |
| `remotion-best-practices` | Best practices Remotion | **FUSIONAR** como sección |

**Acción:** Crear UN skill definitivo `video-pipeline-master` que integre todo. Eliminar las 7 skills redundantes.

---

### 3. REMOTION VISUAL (4 → 1)

| Skill | Descripción | Solución |
|-------|-------------|----------|
| `remotion-visual-effects` | Efectos visuales avanzados | **MANTENER** |
| `remotion-diagram-visual-rules` | Reglas diagramas | **FUSIONAR** |
| `remotion-v4-visual-checklist` | Checklist visual V4 | **FUSIONAR** |
| `remotion-v9-design-rules` | Reglas diseño V9 | **FUSIONAR** |

---

### 4. SCRIPT WRITING (3 → 1)

| Skill | Descripción | Solución |
|-------|-------------|----------|
| `script-writing` | Script writing ByteMonk 5-fases | **MANTENER** |
| `viral-script-system` | Sistema guiones virales V2.2 | **FUSIONAR** como sección de hooks |
| `hook-generation` | 3-step hooks | **FUSIONAR** como sección |

---

### 5. OBSIDIAN/VAULT (4 → 2)

| Skill | Descripción | Solución |
|-------|-------------|----------|
| `file-search-and-obsidian-organization` | Búsqueda + organización | **MANTENER** |
| `obsidian-vault-organization` | Organización vault (mismo nombre de categoría) | **ELIMINAR** — duplicada |
| `vault-organization-principles` | Principios organización | **FUSIONAR** en file-search |
| `vault-naming-convention` | Convención naming | **MANTENER** — específica y útil |

---

### 6. B2B OUTREACH (2 → 1)

| Skill | Descripción | Solución |
|-------|-------------|----------|
| `b2b-outreach` | Pipeline prospección B2B | **MANTENER** |
| `b2b-outreach-v6-addendum` | Addendum V6 | **FUSIONAR** en b2b-outreach |

---

### 7. REMOTION VIDEO PRODUCTION (5 → 2)

| Skill | Descripción | Solución |
|-------|-------------|----------|
| `minimax-tts` | MiniMax TTS español | **MANTENER** |
| `tts-voice-configuration` | Config voz TTS | **FUSIONAR** en minimax-tts |
| `video-long-audio-format` | Formato audio largo | **FUSIONAR** en minimax-tts |
| `telegram-media-delivery-debug` | Debug Telegram | **MANTENER** — específico |
| `remotion-v9-design-rules` | Reglas diseño V9 | **FUSIONAR** en video-pipeline-master |

---

### 8. ZOR INDEXING (3 → 1)

| Skill | Descripción | Solución |
|-------|-------------|----------|
| `zor-content-index` | Índice centralizado | **MANTENER** |
| `zor-content-indexing` | Sistema de indexación | **ELIMINAR** — duplicada |
| `zor-skill-registry` | Índice de skills | **MANTENER** — útil para no duplicar skills |

---

### 9. CONTENT CURATION (3 → 2)

| Skill | Descripción | Solución |
|-------|-------------|----------|
| `content-curation-workflow` | Workflow curación contenido YouTube | **MANTENER** |
| `guion-curation` | Procesar guiones crudos | **MANTENER** — nueva, útil |
| `jett-franzen-curation` | Curar vídeos Jett Franzen | **ELIMINAR** — demasiado específico, guion-curation lo cubre |

---

### 10. QUARTZ / DIGITAL GARDEN (2 → 1)

| Skill | Descripción | Solución |
|-------|-------------|----------|
| `quartz-digital-garden` | Deploy vault con Quartz V5 | **MANTENER** |
| `obsidian-quartz-publish` | Publicar vault con Quartz | **ELIMINAR** — duplicada |

---

## 🟡 SKILLS QUE NO APORTAN (Eliminar)

| Skill | Razón |
|-------|-------|
| `dogfood` | QA de webs — no lo usas |
| `gaming` (2 skills) | Minecraft y Pokemon — no aportan a tu negocio |
| `red-teaming/godmode` | Jailbreak LLMs — no lo usas |
| `pokemon-player` | No aporta |
| `minecraft-modpack-server` | No aporta |
| `heartmula` | Suno-like music — no lo usas |
| `songsee` | Audio spectrograms — no lo usas |
| `design-md` | Google DESIGN.md — no lo usas |
| `pretext` | Browser demos — no lo usas |
| `pixel-art` | No lo usas |
| `ascii-art` | No lo usas |
| `ascii-video` | No lo usas |
| `popular-web-designs` | No lo usas |
| `ideation` | Gen ideas — genérico, no aporta valor específico |
| `humanizer` | Humanize text — no lo usas |
| `excalidraw` | Diagramas — no lo usas |
| `comparison-video` | Vídeos comparativos — no es tu formato |
| `horizontal-video-master` | Vídeos horizontales educativos — no es tu formato |
| `manim-video` | Animaciones matemáticas — no lo usas |
| `p5js` | Sketches — no lo usas |
| `touchdesigner-mcp` | TouchDesigner — no lo usas |
| `comfyui` | ComfyUI — no lo usas |
| `portfolio-web-dev` | Ya tienes la web |
| `web-audit` | No lo usas |
| `wikidata-philosopher-connections` | No lo usas |
| `zor-coaching-system` | No lo usas |
| `hermes-meta-learning` | Meta-aprendizaje — interesante pero no urgente |
| `personalized-content-enrichment` | No lo usas |
| `book-highlights-pipeline` | No lo usas |
| `autonomous-research-vault` | No lo usas |
| `autonomous-content-research` | No lo usas |
| `content-pipeline-vault` | No lo usas |
| `dani-marzana-formato-2026` | Ya está en la memoria |
| `obsidian-bases-syntax` | No usas Bases |
| `obsidian` | Genérico — file-search lo cubre |
| `note-taking/obsidian` | Duplicada |
| `file-search-and-obsidian-organization` | La categoría entera es una skill duplicada |

---

## 🟢 SKILTS QUE SÍ APORTAN (Mantener y Potenciar)

### Core de Guiones y Contenido
- `dani-marzana-script-system-v3` — Sistema principal de guiones
- `dani-marzana-brand` — Marca personal
- `dani-marzana-script-workflow` — Flujo de trabajo (fusionar en V3)
- `guion-curation` — Procesar guiones crudos (nueva, útil)
- `script-writing` — Escritura de guiones
- `hook-generation` — Generación de hooks
- `talking-head-script-critique` — Crítica de guiones
- `viral-script-system` — Sistema viral (fusionar en V3)

### Investigación
- `hermakin-research-depth` — Research V3
- `firecrawl-research` — Research con Firecrawl
- `expert-quote-research` — Búsqueda de citas
- `content-curation-workflow` — Curación de contenido
- `youtube-transcription` — Transcripciones
- `transcriptapi-youtube` — Transcripciones alternativa
- `polymarket` — Polymarket (si lo usas)

### Video y Audio
- `short-video-pipeline` — Pipeline principal (fusionar demás)
- `remotion-visual-effects` — Efectos visuales
- `tts-word-sync` — Sync TTS
- `minimax-tts` — TTS español
- `telegram-media-delivery-debug` — Debug Telegram
- `brand-logos` — Logos para vídeos

### Vault y Obsidian
- `file-search-and-obsidian-organization` — Búsqueda + organización
- `vault-naming-convention` — Naming
- `vault-navigation` — Navegación rápida
- `vault-audit-methodology` — Auditoría
- `zettelkasten-vault-connections` — Conexiones
- `notebooklm-workflow` — Flujo NotebookLM
- `zor-content-index` — Índice de contenido
- `zor-skill-registry` — Índice de skills

### Outreach y Negocio
- `b2b-outreach` — Prospección B2B
- `env-secrets-access` — Acceso a secrets

### Sistema
- `telegram-audio-delivery` — Envío audios Telegram
- `telegram-obsidian-workflow' — Workflow Telegram+Obsidian
- `zor-vault-github' — GitHub vault setup

### Utilidades
- `himalaya` — Email terminal
- `spotify` — Spotify
- `maps` — Mapas
- `notion` — Notion
- `airtable` — Airtable
- `linear` — Linear
- `github-*` (5 skills) — GitHub
- `mcporter` — MCP
- `native-mcp` — MCP
- `gif-search` — GIFs
- `ocr-and-documents` — OCR
- `nano-pdf` — PDF editing
- `powerpoint' — PowerPoint
- `anki-flashcard-generator` — Flashcards
- `google-workspace` — Google
- `xitter` — Twitter
- `xurl` — Twitter
- `find-nearby` — Lugares cercanos
- `openhue` — Luces Hue

---

## 📊 RESUMEN DE ACCIONES

| Acción | Cantidad |
|--------|----------|
| **Eliminar** | ~45 skills |
| **Fusionar** | ~15 skills |
| **Mantener** | ~120 skills |
| **Nuevo total** | ~120 skills (de 181) |

---

## 🎯 PLAN DE ACCIÓN RECOMENDADO

### Fase 1: Limpieza rápida (eliminar obvias)
1. Eliminar skills de gaming, red-teaming, diseño web, música, etc.
2. Eliminar skills duplicadas (b2b-outreach-v6-addendum, obsidian-quartz-publish, etc.)
3. Eliminar skills que no usas (dogfood, comfyui, touchdesigner, etc.)

### Fase 2: Fusión de skills de vídeo
1. Crear `video-pipeline-master` fusionando las 8 skills de vídeo
2. Crear `remotion-visual-master` fusionando las 4 skills de visual
3. Eliminar las skills originales

### Fase 3: Fusión de skills de guiones
1. Fusionar `script-feedback` y `script-workflow` en `script-system-v3`
2. Fusionar `hook-generation` y `viral-script-system` en `script-system-v3`
3. Eliminar las skills originales

### Fase 4: Limpieza de Obsidian
1. Eliminar `obsidian-vault-organization` (duplicada)
2. Fusionar `vault-organization-principles` en `file-search-and-obsidian-organization`
3. Eliminar `obsidian` (genérica)

### Fase 5: Revisión final
1. Verificar que las skills restantes no se solapan
2. Actualizar `related_skills` en cada skill
3. Verificar que los triggers "When to Use" sean claros y no se solapen

---

## 💡 MEJORAS PROPUESTAS

### 1. Skill de Títulos y Hooks para YouTube
Crear un skill dedicado a generar títulos con alto CTR para YouTube, basado en el análisis de Motiversity, Eric Thomas, etc. Incluir:
- Fórmulas de títulos por tipo de contenido
- Palabras clave de alto CTR
- Hooks para los primeros 30 segundos
- Estrategia de thumbnails

### 2. Skill de Conexiones con Autores
Crear un skill que defina cómo conectar cualquier nota nueva con los autores del vault (Hormozi, Goggins, Bravo, Franzen, Segués, Heras, Miralles). Incluir:
- Mapa de temas por autor
- Citas clave de cada autor
- Framework de conexión temática

### 3. Skill de Procesamiento de Guiones Crudos
El skill `guion-curation` que creé hoy está bien pero necesita más detalle sobre:
- Cómo generar títulos con hooks
- Cómo conectar con autores
- Cómo generar posibles guiones derivados
- Cómo guardar en el vault

---

*Review generado por Zor — 2026-06-07*
