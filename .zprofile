eval "$(anyenv init -)"
eval "$(nodenv init -)"
eval "$(rbenv init -)"
eval "$(goenv init -)"

export LANG=en_US.UTF-8
export ANYENVPATH="$HOME/.anyenv/bin:$PATH"
export HOMEBREWPATH=/opt/homebrew/bin:$PATH
export PYTHONPATH=/opt/homebrew/opt/python@3.9/libexec/bin:$PATH
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export STARSHIP_CONFIG="$HOME/.zsh/starship/config.toml"
