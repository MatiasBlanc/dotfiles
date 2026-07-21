# --- Configuración de Zinit ---
# Carga automática de Zinit
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Instalando Zinit…%f"
    mkdir -p "$(dirname $HOME/.local/share/zinit/zinit.git)"
    git clone https://github.com/zdharma-continuum/zinit.git "$HOME/.local/share/zinit/zinit.git"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

# --- Plugins de Zinit ---
zinit light zdharma-continuum/zinit-annex-as-monitor
zinit light zdharma-continuum/zinit-annex-bin-gem-node
zinit light zdharma-continuum/zinit-annex-patch-dl
zinit light zdharma-continuum/zinit-annex-rust

# --- Zoxide (Integración rápida) ---
zinit ice wait"0" lucid
zinit light ajeetdsouza/zoxide
eval "$(zoxide init zsh)"

# --- Starship (Prompt) ---
# Se recomienda instalar starship en tu sistema (dnf install starship)
zinit ice wait"0" lucid
zinit light starship/starship
eval "$(starship init zsh)"

# --- Opciones básicas ---
setopt autocd

alias idea='~/programas/idea-2026.1.4/idea-IU-261.26222.65/bin/idea.sh'

export PATH=~/.npm-global/bin:$PATH
export PATH="/home/mblanc/.local/bin:$PATH"

# bun completions
[ -s "/home/mblanc/.bun/_bun" ] && source "/home/mblanc/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
