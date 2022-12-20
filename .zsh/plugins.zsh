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

# NOTE: https://gist.github.com/ctechols/ca1035271ad134841284
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi;

# eval "$(direnv hook zsh)"
