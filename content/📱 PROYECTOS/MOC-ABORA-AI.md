---
title: '📱 MOC — Abora AI: Chat with Legends'
modified: 2026-06-07T20:38:53
created: 2026-06-02T11:45:43
---

# 📱 MOC — Abora AI: Chat with Legends

> **Proyecto:** Abora AI — App de chat con figuras históricas
> **Estado:** Análisis completado — pendiente desarrollo iterativo
> **Play Store:** https://play.google.com/store/apps/details?id=com.mycompany.cwsproject
> **Desarrollador:** ChatCore Labs
> **Última actualización:** 2026-05-31

---

## 📋 Resumen Ejecutivo

Abora AI es una app Android de chat con figuras históricas. Cada figura tiene un system prompt que define su personalidad. El usuario chatea con ellas y cada X mensajes desbloquea "cartas" con frases, logros, personas cercanas. Tiene sección de "enseñar" para revisar frases/eventos. TTS multilingüe. 50+ descargas. Categoría educación.

**El concepto es sólido. La ejecución actual es limitada.**

---

## 🔍 Análisis del Estado Actual

### Lo que existe
- Cientos de figuras históricas con system prompts
- Mecánica de desbloqueo de cartas (gamification)
- Cartas con: frases, logros, personas cercanas, eventos
- Sección "enseñar" para repasar contenido
- TTS multilingüe
- Smart follow-ups (preguntas sugeridas)

### Problemas identificados
- Cada figura es solo un prompt + cartas manuales — no hay base de conocimiento real
- Escalar es costoso (carga manual de cartas)
- No genera conocimiento nuevo — solo muestra contenido pre-cargado
- Sin conexión entre figuras
- Sin export de contenido
- Sin integración con herramientas externas

---

## 🧠 Plan de Evolución (Priorizado)

### P0 — Knowledge Base Engine (FUNDAMENTAL)
**De chat con prompts → motor de conocimiento con RAG**

- Cada figura tiene acceso a una base de conocimiento vectorial (RAG)
- Cargar obras completas, escritos, discursos, biografías en vector DB
- Cada figura = namespace de conocimiento propio
- Respuestas citan fuentes reales, no inventan
- Esto lo convierte en motor de investigación personal

### P1 — Búsqueda Temática Cross-Figura (KILLER FEATURE)
**Caso de uso principal de Daniel: "¿De qué hablaría X sobre Y?"**

- Input: un tema → output: ranking de figuras relevantes
- Embedding search en todas las bases de conocimiento
- Devuelve: "Esta figura tiene N fragmentos relevantes, estas son sus posiciones"
- Da directamente: quién habla de qué, qué dijo exactamente, con qué autoridad

### P2 — Cartas Dinámicas Auto-Generadas
**Escalar sin trabajo manual**

Tipos de cartas automáticas:
- **Citas directas** (verificadas, con fuente)
- **Contexto temporal** (qué estaba pasando cuando dijo esto)
- **Personas conectadas** (quién influyó en esta idea)
- **Ideas relacionadas** (conexiones con otras figuras)
- **Contraargumentos** (quién pensaba lo opuesto)

### P3 — Modo "Debate" entre Figuras
**Contenido de vídeo directamente**

- Simular debate entre dos figuras sobre un tema
- Basado en textos reales, no prompts genéricos
- "¿Qué diría Nietzsche sobre la IA?" → respuesta basada en sus textos

### P4 — Export para Guión / Obsidian
**Integración con flujo de trabajo de Daniel**

- Cada conversación/búsqueda exportable como:
  - Markdown estructurado (para vault de Obsidian)
  - Fragmentos citables (para guión de vídeo)
  - Mapa de conexiones (qué figuras se conectan por qué temas)

### P5 — Sección "Enseñar" 2.0
**De repaso pasivo a aprendizaje activo**

- Flashcards con frase/evento en un lado, contexto en otro
- Quiz de conexión: "¿Quién dijo esto?" / "¿Qué evento conecta estas dos figuras?"
- Timeline interactiva: evolución del pensamiento de una figura

---

## 🚫 Lo que NO tiene sentido hacer

- Más gamification (niveles, XP) — no es un juego, es herramienta de conocimiento
- Más figuras sin base de conocimiento real — cantidad sin calidad es ruido
- TTS como feature principal — es un add-on, no el core

---

## 📊 Estado de Desarrollo

| Feature | Estado | Prioridad |
|---------|--------|-----------|
| Chat con figuras (system prompts) | ✅ Existente | — |
| Cartas manuales | ✅ Existente | — |
| TTS multilingüe | ✅ Existente | — |
| RAG por figura | ❌ Pendiente | P0 |
| Búsqueda temática cross-figura | ❌ Pendiente | P1 |
| Cartas dinámicas auto-generadas | ❌ Pendiente | P2 |
| Modo debate | ❌ Pendiente | P3 |
| Export Obsidian/Markdown | ❌ Pendiente | P4 |
| Flashcards + Quiz | ❌ Pendiente | P5 |

---

## 🔗 Conexiones con Otros Proyectos

- **Canal Dani Marzán:** Abora como herramienta de investigación para guiones
- **Zor Vault:** Export de notas y flashcards al vault de Obsidian
- **Sistema Zor:** Posible integración con skills de investigación

---

## 📝 Notas de Desarrollo Futuro

> **Nota:** La actualización de la app vía lenguaje natural → GitHub es inviable actualmente. Requiere que los modelos mejoren drásticamente. Por ahora, este documento sirve como roadmap y referencia para cuando sea posible.

### Principios de diseño
1. Calidad > cantidad (mejor 50 figuras con RAG que 500 con prompts)
2. Fuentes primarias siempre que sea posible
3. Trazabilidad: cada respuesta debe poder citar su fuente
4. Interconexión: las figuras no existen en aislamiento
5. Exportabilidad: el contenido debe poder salir de la app

---

*Documento vivo. Se actualiza con cada iteración del proyecto.*
