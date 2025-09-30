#!/bin/bash
set -e

INSTALL_DIR="/vo3lk3ros"

# Ensure required commands are available
for cmd in git bash; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "[ERROR] Required command '$cmd' not found. Please install it and retry." >&2
        exit 1
    fi
done

# Check write permissions for installation directory
if [ -e "$INSTALL_DIR" ]; then
    if [ ! -w "$INSTALL_DIR" ]; then
        echo "[ERROR] Cannot write to $INSTALL_DIR. Please run with appropriate permissions." >&2
        exit 1
    fi
else
    if [ ! -w "/" ]; then
        echo "[ERROR] Cannot create $INSTALL_DIR. Please run with appropriate permissions." >&2
        exit 1
    fi
fi

echo "[Vo3lk3rOS Auto-Installer] Repository wird geklont..."
 git clone https://github.com/Vo3lk3r/Vo3lk3rOS-.git "$INSTALL_DIR"
 cd "$INSTALL_DIR"
 bash "$INSTALL_DIR/system/bootstrap_v1.sh"
 bash "$INSTALL_DIR/system/install_gpts.sh"
 bash "$INSTALL_DIR/moneymaker/start_moneymaker.sh"
 bash "$INSTALL_DIR/alpha_control/alpha_watchdog.sh"
