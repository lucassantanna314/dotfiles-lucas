#!/bin/bash

# Caminho da pasta de wallpapers
WALLPAPER_DIR="/home/lucas/dotfiles/wallpapers"

# Tempo de espera (1h = 3600 segundos)
INTERVAL=3600

# Loop infinito
while true; do
  # Lista os arquivos de imagem (jpg, png, webp) de forma ordenada
  find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.webp" \) | sort | while read -r img; do
    # Muda o wallpaper usando o swww
    swww img "$img" --transition-type center --transition-step 30 --transition-fps 60

    # Espera o tempo definido
    sleep $INTERVAL
  done
done
