#!/bin/bash

# Se o script receber o argumento "next", ele troca o modo.
# Se não receber nada (chamada do "exec" da Waybar), ele apenas informa o modo atual.
if [ "$1" == "next" ]; then
  CURRENT=$(powerprofilesctl get)
  case $CURRENT in
  performance) powerprofilesctl set balanced ;;
  balanced) powerprofilesctl set power-saver ;;
  power-saver) powerprofilesctl set performance ;;
  esac
fi

# Pega o modo atual (seja o novo ou o que já estava)
NEW_MODE=$(powerprofilesctl get)

# Define o ícone e texto curto
case $NEW_MODE in
performance)
  ICON="󰓅"
  TEXT="Perf"
  ;;
balanced)
  ICON="󰾅"
  TEXT="Bal"
  ;;
power-saver)
  ICON="󰾆"
  TEXT="Eco"
  ;;
esac

# Retorna o JSON para a Waybar
echo "{\"text\": \"$ICON $TEXT\", \"tooltip\": \"Modo Atual: $NEW_MODE\"}"
