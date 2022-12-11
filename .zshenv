#
# Defines environment variables.
#

export LANG=en_US.UTF-8
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export HOMEBREWPATH=/opt/homebrew/bin
export GOBIN=$HOME/go/bin
export LUAPATH=$HOME/.local/share/nvim/lsp_servers/sumneko_lua
export STARSHIP_CONFIG=$HOME/.zsh/starship/config.toml
export TERM=screen-256color
export LG_CONFIG_FILE=~/.config/lazygit/config.yml
export GPG_TTY=$(tty)

. /usr/local/opt/asdf/libexec/asdf.sh
