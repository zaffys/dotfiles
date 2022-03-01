export LANG=en_US.UTF-8
export HOMEBREWPATH=/opt/homebrew/bin:$PATH
export GOPATH=$HOME/go
export GOBINPATH=$PATH:$GOPATH/bin
export LUAPATH=$PATH:$HOME/.local/share/nvim/lsp_servers/sumneko_lua
export STARSHIP_CONFIG=$HOME/.zsh/starship/config.toml
export TERM=screen-256color
export PATH="$(yarn global bin):$PATH"
export CONFIG_DIR=$PATH:~/.config/lazygit

. /usr/local/opt/asdf/libexec/asdf.sh
