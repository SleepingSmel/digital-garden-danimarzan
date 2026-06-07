# 🔧 Fuentes y Herramientas de Investigación

> Compilación de fuentes útiles para investigación, verificación de datos y extracción de contenido.
> Actualizado: 18 Mayo 2026

---

## 📚 Bases de Datos Académicas Gratuitas

### Las más útiles para tu nicho (filosofía, psicología, sociedad)

| Fuente | Contenido | URL | Notas |
|--------|-----------|-----|-------|
| **OpenAlex** | 250M+ trabajos académicos | api.openalex.org | Sucesor de Microsoft Academic. API libre, sin key. Bibliometría, redes de autores |
| **Crossref** | 150M+ artículos con DOI | api.crossref.org | Citas, resolución de DOI. Sin key. Pool "polite" con email = 10x más rápido |
| **Semantic Scholar** | 203M+ papers | semanticscholar.org | IA-powered, resúmenes TLDR, enlaces a texto completo. Sin key |
| **CORE** | 219M+ artículos OA | core.ac.uk | Mayor colección de acceso abierto. API con key gratuita |
| **PubMed** | 36M+ papers médicos | ncbi.nlm.nih.gov/books/NBK25501/ | E-utilities API. Sin key. Salud, psicología clínica |
| **arXiv** | 2M+ preprints | arxiv.org | Física, matemáticas, CS, IA. Sin key. Investigación antes de peer review |
| **DOAJ** | 6.8M+ artículos | doaj.org | Directorio de journals OA peer-reviewed. Multidisciplinar |
| **SSRN** | 915K+ papers | ssrn.com | Ciencias sociales, economía, derecho. Registro gratuito |
| **JURN** | 5K+ journals | jurn.link | Artes, humanidades, ciencias. Motor de búsqueda Google custom |
| **BASE** | 276M+ documentos | base-search.net | Bielefeld Academic Search Engine. 60% OA |

### APIs Académicas (sin key)

```python
# OpenAlex - Buscar papers
import requests
resp = requests.get("https://api.openalex.org/works", params={
    "search": "loneliness epidemic young adults",
    "per_page": 5,
    "sort": "cited_by_count:desc"
})
for work in resp.json()["results"]:
    print(f"{work['title']} | {work['cited_by_count']} citas | {work['publication_year']}")

# Crossref - Buscar por DOI o keyword
resp = requests.get("https://api.crossref.org/works", params={
    "query": "Easterlin paradox happiness",
    "rows": 3,
    "mailto": "tu@email.com"  # polite pool
})

# Semantic Scholar
resp = requests.get("https://api.semanticscholar.org/graph/v1/paper/search", params={
    "query": "social isolation modern society",
    "limit": 5,
    "fields": "title,year,citationCount,openAccessPdf"
})
```

---

## 🎬 Extracción de Transcripciones de YouTube

### Opción 1: TranscriptAPI.com (ACTUAL - funciona desde VPS)
- **Key**: `sk_v5eslBCzSqRpnJOhnxLd7AVU6fA-JVpzJeVTdw-4P0w`
- **Costo**: 1 crédito por vídeo
- **Límite**: 200 requests/min
- **Ventaja**: Funciona desde VPS/cloud IPs
- **Desventaja**: Créditos limitados

### Opción 2: Apify YouTube Transcript Scraper (ALTERNATIVA)
- **URL**: apify.com/codepoetry/youtube-transcript-ai-scraper
- **Costo**: $0.001/vídeo (captions), $0.012/min (AI fallback)
- **Ventaja**: AI fallback con Whisper para vídeos sin captions
- **Desventaja**: Requiere cuenta Apify, pay-per-result
- **Código**:
```python
from apify_client import ApifyClient
client = ApifyClient("YOUR_API_TOKEN")
run = client.actor("codepoetry/youtube-transcript-ai-scraper").call(
    run_input={
        "startUrls": [{"url": "https://www.youtube.com/watch?v=VIDEO_ID"}],
        "languages": ["en"],
        "outputFormats": ["json", "llm"],
        "aiFallback": True,
        "maxAiMinutes": 60  # límite de seguridad
    }
)
```

### Opción 3: youtube-transcript-api (INSTALADO pero bloqueado desde VPS)
- **Paquete**: `youtube-transcript-api` (instalado)
- **Problema**: YouTube bloquea IPs de cloud/VPS
- **Uso**: Solo funciona desde IP residencial o con proxies

---

## 🔍 Búsqueda Web

### Firecrawl (ACTUAL)
- **Search**: Búsqueda web estructurada
- **Scrape**: Extracción de contenido de páginas
- **Crawl**: Rastreo multi-página
- **Map**: Descubrimiento de URLs
- **Agent**: Investigación autónoma
- **Limitación**: Créditos limitados

### Exa API (DISPONIBLE - no usado aún)
- **Tipo**: Búsqueda neuronal (semantic search)
- **Ventaja**: Mejor calidad que búsqueda keyword tradicional
- **Key**: Disponible en `/opt/data/.env` como `EXA_API_KEY`
- **Uso**: Encontrar contenido similar/relevante semánticamente

### Brave Search API (DISPONIBLE)
- **Key**: Disponible en `/opt/data/.env`
- **Ventaja**: Independiente, no Google
- **Gratis**: 2000 requests/mes

---

## 📊 Fuentes de Datos Específicas para tu Nicho

### Psicología y Sociedad
- **APA PsycNet**: psycnet.apa.org (psicología académica)
- **Pew Research**: pewresearch.org (datos sociales, encuestas)
- **Gallup**: gallup.com (encuestas globales, bienestar)
- **World Happiness Report**: worldhappiness.report (datos anuales)
- **Our World in Data**: ourworldindata.org (datos globales visualizados)

### Filosofía y Pensamiento
- **Stanford Encyclopedia of Philosophy**: plato.stanford.edu (artículos académicos revisados)
- **Internet Encyclopedia of Philosophy**: iep.utm.edu
- **PhilPapers**: philpapers.org (índice de papers filosóficos)

### Datos Demográficos y Sociales
- **UN Data**: data.un.org (Naciones Unidas)
- **World Bank Open Data**: data.worldbank.org
- **Census Bureau**: census.gov (datos USA)
- **Eurostat**: ec.europa.eu/eurostat (datos Europa)

---

## ⚡ Optimizaciones del Flujo de Trabajo

### Problemas Detectados
1. ❌ No tengo `curl` instalado (sin permisos apt)
2. ❌ `yt-dlp` instalado pero YouTube bloquea VPS
3. ❌ `youtube-transcript-api` instalado pero bloqueado desde VPS
4. ❌ Firecrawl tiene créditos limitados
5. ❌ No uso Exa API (tengo key pero no la he usado)
6. ❌ No guardo caché de investigaciones (repito búsquedas)

### Optimizaciones Implementadas
1. ✅ Registro de transcripciones (`_REGISTRO.md`)
2. ✅ Índice de investigaciones (`/opt/data/research/INDICE.md`)
3. ✅ Caché de investigaciones (`/opt/data/research/cache/`)
4. ✅ yt-dlp instalado (para otras fuentes)
5. ✅ youtube-transcript-api instalado (backup)

### Recomendaciones Pendientes
1. **Instalar curl**: `apt-get install curl` (necesita sudo)
2. **Usar Exa API**: Para búsqueda semántica de alta calidad
3. **Usar Brave Search**: Como alternativa a Firecrawl search
4. **Usar firecrawl_agent**: Para investigación autónoma compleja
5. **Guardar todo en caché**: Cada investigación en `/opt/data/research/cache/`

---

## 📝 Notas de Uso

### Orden de Prioridad para Investigación
1. **Búsqueda local**: `grep` en vault + caché de investigaciones
2. **Búsqueda web**: Exa API (semántica) > Firecrawl search > Brave Search
3. **Extracción**: Firecrawl scrape (páginas individuales) > Browser CDP (JS-heavy)
4. **Académico**: OpenAlex > Semantic Scholar > Crossref > PubMed
5. **Transcripciones**: TranscriptAPI.com (única opción desde VPS)

### Cuándo Usar Cada Herramienta
- **Firecrawl search**: Búsqueda general, noticias, datos actuales
- **Firecrawl scrape**: Extraer contenido de una página específica
- **Firecrawl agent**: Investigación compleja multi-paso
- **Exa**: Encontrar contenido similar a un texto dado
- **OpenAlex/Semantic Scholar**: Papers académicos, citas, autores
- **TranscriptAPI**: Transcripciones de YouTube
- **Browser CDP**: Sitios que bloquean todo lo demás

---

*Documento mantenido por Zor — Actualizar al encontrar nuevas fuentes útiles*
