#!/usr/bin/env bash
set -euo pipefail

# Lock first, then suspend after a short delay to avoid exposing the session on resume.
if command -v hyprlock >/dev/null 2>&1; then
  if ! pgrep -x hyprlock >/dev/null 2>&1; then
    hyprlock &
  fi
  sleep 1
fi

systemctl suspend
