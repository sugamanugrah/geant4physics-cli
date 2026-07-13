#!/usr/bin/env bash
set -e

RAW_URL="https://raw.githubusercontent.com/sugamanugrah/geant4physics-cli/main/GEANT4PHYSICS"
INSTALL_DIR="$HOME/bin"

echo "Installing GEANT4PHYSICS..."

mkdir -p "$INSTALL_DIR"
curl -fsSL "$RAW_URL" -o "$INSTALL_DIR/GEANT4PHYSICS"
chmod +x "$INSTALL_DIR/GEANT4PHYSICS"

# Ensure CRLF-safe
sed -i 's/\r$//' "$INSTALL_DIR/GEANT4PHYSICS" 2>/dev/null || true

# Add to PATH if not already
if ! grep -q "$INSTALL_DIR" ~/.bashrc 2>/dev/null; then
  echo "export PATH=\"$INSTALL_DIR:\$PATH\"" >> ~/.bashrc
fi

echo "Installed! Run: source ~/.bashrc  (or restart your terminal)"
echo "Then just type: GEANT4PHYSICS"
