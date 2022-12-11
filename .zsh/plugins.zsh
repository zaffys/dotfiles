zinit ice from"gh-r" as"program" atload'!eval $(starship init zsh)'
zinit wait lucid blockf light-mode for \
  @'BurntSushi/ripgrep' \
  @'sharkdp/bat' \
  @'sharkdp/fd' \
  @'starship/starship' \
  @'zdharma/history-search-multi-word' \
  @'zdharma-continuum/fast-syntax-highlighting' \
  @'zsh-users/zsh-syntax-highlighting' \
  @'zsh-users/zsh-history-substring-search' \
  @'zsh-users/zsh-autosuggestions' \
  @'zsh-users/zsh-completions' \
  @'djui/alias-tips' \

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/z-a-rust \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-bin-gem-node

zinit ice from"gh-r" as"program" atload'!eval $(starship init zsh)'
zinit light starship/starship
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search
zinit ice wait'0'; zinit light zsh-users/zsh-completions
autoload -Uz compinit && compinit

eval "$(direnv hook zsh)"
