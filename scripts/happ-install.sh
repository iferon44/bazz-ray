#!/bin/bash
# Install Happ proxy client from latest GitHub release
# https://github.com/Happ-proxy/happ-desktop
set -euo pipefail
echo "[happ-install] Fetching latest Happ release..."
RPM_URL=$(curl -fsSL https://api.github.com/repos/Happ-proxy/happ-desktop/releases/latest \
  | grep -o '"browser_download_url": *"[^"]*x64\.rpm"' \
  | grep -o 'https://[^"]*')
if [[ -z "$RPM_URL" ]]; then
  echo "[happ-install] ERROR: Could not find RPM URL" >&2
  exit 1
fi
echo "[happ-install] Installing: $RPM_URL"
rpm-ostree install --idempotent "$RPM_URL"
echo "[happ-install] Done."
