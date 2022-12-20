### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

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
### End of Zinit's installer chunk

zinit wait lucid light-mode as'null' \
    atinit'source "$HOME/.zshrc.lazy"' \
    for 'zdharma-continuum/null'

source $HOME/.zshenv

export PNPM_HOME=$HOME/.asdf/installs/pnpm/7.16.1

export PATH=$HOME/.local/bin:$PNPM_HOME/bin:$PATH

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

eval "$(starship init zsh)"

. /usr/local/opt/asdf/libexec/asdf.sh

asdf global pnpm 7.16.1
pnpm config set global-bin-dir $PNPM_HOME/bin
