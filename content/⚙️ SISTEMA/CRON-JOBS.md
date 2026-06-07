---
title: "🤖 CRON JOBS ACTIVOS — Sistema Zor"
---

# 🤖 CRON JOBS ACTIVOS — Sistema Zor

> Última actualización: 2026-05-28
> Gestión: Telegram con Zor (Hermes Agent)

---

## Cron Jobs Programados

| Nombre | ID | Frecuencia | Hora | Entrega | Estado |
|--------|-----|-----------|------|---------|--------|
| Auditoría Diaria Vault | `3cf1ebaaf509` | Diaria | 23:30 | Telegram (DM) | ✅ Activo |

---

## Auditoría Diaria Vault

**Qué hace:** Cada día a las 23:30 hace pull del repo, analiza la vault, detecta duplicados/carpetas vacías/archivos huérfanos, actualiza AUDITORIA-VAULT.md y envía un resumen accionable por Telegram.

**Recibe:** Mensaje de Telegram con el resumen del día. Máx 15 líneas. Prioriza acciones concretas: qué eliminar, qué crear, qué pulir.

**Propósito:**
- Mantener la vault limpia y ejecutable
- Detectar sobrecarga de información antes de que genere parálisis
- Informar a Daniel de cambios relevantes sin él tener que revisar
- Que tanto Zor como Cloud Co-Work tengan contexto actualizado de la estructura

**Nota para Cloud Co-Work:** Esta auditoría corre automáticamente cada noche. Si modificas la vault durante el día, al día siguiente aparecerán los cambios en el resumen. Si necesitas adelantar una auditoría, pide pull + análisis manual a Zor por Telegram.

---

*Para modificar o pausar un cron, contactar con Zor por Telegram.*
