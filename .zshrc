source $HOME/.zsh/plugins.zsh
source $HOME/.zsh/alias.zsh
source $HOME/.zsh/config.zsh
source $HOME/.zshenv

export PNPM_HOME=$HOME/.asdf/installs/pnpm/7.16.1

export PATH=$HOME/.local/bin:$PNPM_HOME/bin:$PATH
pnpm config set global-bin-dir $PNPM_HOME/bin


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"
