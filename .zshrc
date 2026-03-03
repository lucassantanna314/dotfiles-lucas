# Binds
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^H" backward-kill-word
bindkey "^[[3;5~" kill-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word


# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Fzf
source <(fzf --zsh)
# Startship Prompt
eval "$(starship init zsh)"

export MSBuildAllowMissingPrunePackageData=true

function update_setup() {
    cd ~/dotfiles

    # Sincroniza as pastas principais
    cp -r ~/.config/{hypr,kitty,nvim,waybar,lazygit,nwg-look,gtk-3.0,gtk-4.0,nemo} .
    cp ~/.config/starship.toml .
    cp -r ~/wallpapers .
    cp ~/.zshrc .
    
    # Atualiza as listas de apps
    pacman -Qqe | grep -v "$(pacman -Qmq)" > pkglist.txt
    pacman -Qmq > aurlist.txt
    
    # Sobe para o GitHub
    git add .
    git commit -m "Update setup: $(date +'%d/%m/%Y %H:%M')"
    git push
    cd -
}

# Onde o histórico será salvo
HISTFILE=~/.zsh_history

# Quantos comandos salvar na sessão atual
HISTSIZE=10000

# Quantos comandos salvar no arquivo permanentemente
SAVEHIST=10000

# Opções para melhorar o histórico:
setopt appendhistory       # Adiciona ao histórico em vez de sobrescrever
setopt sharehistory        # Compartilha o histórico entre diferentes janelas do terminal
setopt hist_ignore_dups    # Não salva comandos repetidos seguidos
setopt hist_ignore_space   # Não salva comandos que começam com espaço
