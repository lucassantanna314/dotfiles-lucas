#!/bin/bash

WALLPAPER_DIR="/home/lucas/dotfiles/wallpapers"
INTERVAL=1800

# Garante que o swww-daemon está rodando, se não, inicia
swww query || swww-daemon &

# Espera 2 segundos para o daemon estabilizar no boot
sleep 2

while true; do
  # Cria uma lista das imagens e troca uma por uma
  for img in "$WALLPAPER_DIR"/*.{jpg,jpeg,png,webp}; do
    # Verifica se o arquivo existe (evita erro se a pasta estiver vazia)
    [ -e "$img" ] || continue

    swww img "$img" --transition-type center --transition-step 30 --transition-fps 60

    # Espera 1 hora antes de ir para a próxima imagem da lista
    sleep $INTERVAL
  done
done
