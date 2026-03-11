#!/bin/bash

# Opções
opcoes="󰐥 Desligar\n󰜉 Reiniciar\n󰤄 Suspender\n󰗼 Sair\n󰷛 Bloquear"

# Seleção via Rofi
escolha=$(echo -e "$opcoes" | rofi -dmenu -i -p "Sistema:" -theme ~/.config/rofi/catppuccin.rasi)

case "$escolha" in
*Desligar) systemctl poweroff ;;
*Reiniciar) systemctl reboot ;;
*Suspender) systemctl suspend ;;
*Sair) hyprctl dispatch exit ;;
*Bloquear) hyprlock ;;
esac
