#!/bin/bash

echo "Iniciando restauração do setup..."

# Instalar um AUR helper se não existir
if ! command -v yay &>/dev/null; then
  git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd .. && rm -rf yay
fi

echo "Instalando pacotes do sistema..."
sudo pacman -S --needed --noconfirm - <pkglist.txt

echo "Instalando pacotes do AUR..."
yay -S --needed --noconfirm - <aurlist.txt

echo "Aplicando configurações..."
mkdir -p ~/.config
cp -r hypr kitty nvim waybar lazygit nwg-look gtk-3.0 gtk-4.0 nemo ~/.config/
cp starship.toml ~/.config/
cp .zshrc ~/

echo "Instalando workloads do .NET 10 para Blazor..."
sudo dotnet workload install wasm-tools

echo "Tudo pronto! Basta reiniciar a sessão."
