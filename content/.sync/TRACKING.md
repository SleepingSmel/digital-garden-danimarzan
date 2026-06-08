---
title: TRACKING
modified: 2026-05-30T06:52:30
created: 2026-05-17T09:57:41
---

# ═══════════════════════════════════════════════════════════════
# SISTEMA DE TRACKING Y REPORT — Zor Vault
# ═══════════════════════════════════════════════════════════════
# 
# Este documento define cómo Zor reporta cada cambio a Daniel.
# Cada acción que Zor realiza queda registrada aquí y se
# envía como resumen periódico.
#
# ═══════════════════════════════════════════════════════════════

## Tipos de Acciones que se Reportan

### 1. Investigaciones
- Búsqueda con Firecrawl
- Análisis de fuentes
- Resúmenes generados
- Flashcards creadas
- Archivo guardado en Research/

### 2. Contenido
- Scripts de video generados
- Audios TTS creados
- Videos renderizados
- Publicaciones preparadas

### 3. Sistema
- Cambios en configuración
- Actualizaciones de skills
- Nuevos crons creados
- Cambios en el vault

### 4. Coaching
- Análisis de audios de Daniel
- Feedback y sugerencias
- Ejercicios recomendados
- Seguimiento de objetivos

## Formato de Report

Cada report incluye:
- **Qué se hizo** (acción concreta)
- **Dónde se guardó** (archivo/ruta)
- **Para qué** (objetivo)
- **Próximo paso** (si aplica)

## Frecuencia

- **Tiempo real:** Cambios críticos (configuración, errores)
- **Diario:** Resumen de investigaciones y contenido
- **Semanal:** Repaso completo + plan siguiente
- **Cada commit:** Log automático en `.sync/changes.log`

## Archivo de Log

Todos los cambios se registran en:
`.sync/changes.log`

Formato:
```
[YYYY-MM-DD HH:MM] [TIPO] Descripción | Archivo: ruta | Objetivo: descripción
```
