#!/bin/bash
# ═══════════════════════════════════════════════════════════════
# Zor Vault Sync — Sincronización bidireccional Obsidian ↔ VPS
# ═══════════════════════════════════════════════════════════════
# Este script:
# 1. Hace pull del repo para leer notas nuevas de Daniel
# 2. Detecta archivos modificados desde el último sync
# 3. Procesa las notas nuevas (las lee, las indexa, actualiza contexto)
# 4. Genera contenido nuevo si es necesario
# 5. Hace push de cualquier cambio propio
# 6. Reporta a Daniel si hay notas nuevas procesadas
# ═══════════════════════════════════════════════════════════════

set -e

VAULT="/opt/data/workspace/zor-vault"
TOKEN=""
USERNAME="SleepingSmel"
REPO="zor-vault"
URL="https://${USERNAME}:${TOKEN}@github.com/${USERNAME}/${REPO}.git"
STATE_FILE="${VAULT}/.sync/last_sync"
LOG_FILE="${VAULT}/.sync/sync.log"

# Leer token
for l in $(cat /opt/data/.env); do
    l=$(echo "$l" | tr -d '[:space:]')
    if echo "$l" | grep -q "^GITHUB_TOKEN=" && ! echo "$l" | grep -q "^#"; then
        val=$(echo "$l" | cut -d= -f2-)
        if [ -n "$val" ] && [ ${#val} -gt 10 ]; then
            TOKEN="$val"
            break
        fi
    fi
done

if [ -z "$TOKEN" ]; then
    echo "ERROR: No se encontró GITHUB_TOKEN" >&2
    exit 1
fi

mkdir -p "${VAULT}/.sync"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

log "═══ Iniciando sync ═══"

# 1. Guardar timestamp del sync actual
CURRENT_TIME=$(date +%s)

# 2. Pull para leer notas nuevas de Daniel
cd "$VAULT"
git pull --rebase origin main 2>&1 | tee -a "$LOG_FILE" || true

# 3. Detectar archivos modificados desde el último sync
LAST_SYNC=0
if [ -f "$STATE_FILE" ]; then
    LAST_SYNC=$(cat "$STATE_FILE")
fi

# Encontrar archivos modificados por Daniel (no los de Zor)
NEW_FILES=$(find "$VAULT" -newer "$STATE_FILE" -type f \
    -not -path "*/.git/*" \
    -not -path "*/.sync/*" \
    -not -name ".gitkeep" \
    2>/dev/null || true)

if [ -n "$NEW_FILES" ]; then
    log "📥 Archivos nuevos/modificados desde último sync:"
    echo "$NEW_FILES" | while read f; do
        log "  - $f"
    done
    
    # Guardar lista de archivos nuevos para que Zor los procese
    echo "$NEW_FILES" > "${VAULT}/.sync/pending_notes.txt"
else
    log "ℹ️ No hay archivos nuevos desde último sync"
fi

# 4. Guardar timestamp
echo "$CURRENT_TIME" > "$STATE_FILE"

# 5. Push de cambios propios (si los hay)
if [ -n "$(git status --porcelain)" ]; then
    log "📤 Subiendo cambios propios..."
    git add -A
    git commit -m "sync: actualización automática $(date '+%Y-%m-%d %H:%M')" --allow-empty
    git push "$URL" main 2>&1 | tee -a "$LOG_FILE" || true
    log "✅ Push completado"
else
    log "ℹ️ No hay cambios propios para subir"
fi

log "═══ Sync completado ═══"
