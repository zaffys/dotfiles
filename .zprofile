eval "$(anyenv init -)"
eval "$(nodenv init -)"
eval "$(rbenv init -)"
eval "$(goenv init -)"

export PATH="$HOME/.yarn/bin:$PATH"
export RAILS_SERVE_STATIC_FILES=1
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.anyenv/bin:$PATH"
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/opt/python@3.9/libexec/bin:$PATH
export GOPATH="$HOME/go"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
export STARSHIP_CONFIG=~/.zsh/starship/config.toml
