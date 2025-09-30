#!/bin/bash
set -e

INSTALL_DIR="/vo3lk3ros"

if [ ! -w "$INSTALL_DIR" ]; then
    echo "[ERROR] Cannot write to $INSTALL_DIR. Please run with appropriate permissions." >&2
    exit 1
fi

echo "[Vo3lk3rOS] Initialsystem wird vorbereitet..."

# Module initialisieren
for dir in alpha_control code_trade data_core moneymaker parallelwelt; do
    mkdir -p "$INSTALL_DIR/$dir/bin"
    touch "$INSTALL_DIR/$dir/README.md"
 done

# Kontroll-Skripte anlegen
cat << '__E' > "$INSTALL_DIR/alpha_control/alpha_watchdog.sh"
#!/bin/bash
echo "[AlphaControl] Leviathan, TrustScore, Heatmap werden geladen..."
# Platzhalter für spätere GPT-Trigger
__E
chmod +x "$INSTALL_DIR/alpha_control/alpha_watchdog.sh"

# Einnahmematrix aktivieren
cat << '__E' > "$INSTALL_DIR/moneymaker/start_moneymaker.sh"
#!/bin/bash
echo "[MoneyMakerGPT] PromptShop & Botsystem starten..."
# Platzhalter für Einnahmefunktionen
__E
chmod +x "$INSTALL_DIR/moneymaker/start_moneymaker.sh"

echo "[DONE] Vo3lk3rOS Grundsystem installiert!"
