#!/bin/bash

# Arquivo temporário para guardar o estado atual do seu setup
STATE_FILE="/tmp/hypr_mode_state"

# Lê o estado. Se o arquivo não existir, assume que começamos no modo "us"
if [ ! -f "$STATE_FILE" ]; then
  CURRENT_STATE="us"
else
  CURRENT_STATE=$(cat "$STATE_FILE")
fi

if [ "$CURRENT_STATE" = "us" ]; then
  # --- VAI PARA MODO PORTÁTIL (Notebook Acer) ---
  echo "br" >"$STATE_FILE"
  notify-send "Modo Portátil" "Teclado ABNT2 e Workspaces no eDP-1" -i input-keyboard

  # Muda para o Índice 1 (BR sem variante)
  hyprctl switchxkblayout all 1

  # Move todas as Workspaces para o monitor do Notebook
  for i in {1..10}; do
    hyprctl dispatch moveworkspacetomonitor $i eDP-1
  done
else
  # --- VAI PARA MODO ESCRITÓRIO (Monitor Externo) ---
  echo "us" >"$STATE_FILE"
  notify-send "Modo Escritório" "Teclado US-Intl e Workspaces Divididas" -i display

  # Muda para o Índice 0 (US com variante Intl)
  hyprctl switchxkblayout all 0

  # Reorganiza Workspaces (2, 4, 6 no HDMI)
  hyprctl dispatch moveworkspacetomonitor 2 HDMI-A-1
  hyprctl dispatch moveworkspacetomonitor 4 HDMI-A-1
  hyprctl dispatch moveworkspacetomonitor 6 HDMI-A-1
  # Garante as outras no eDP-1
  hyprctl dispatch moveworkspacetomonitor 1 eDP-1
  hyprctl dispatch moveworkspacetomonitor 3 eDP-1
  hyprctl dispatch moveworkspacetomonitor 5 eDP-1
fi
