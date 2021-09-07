source <(anyenv init -)

nodenv() {
  unfunction "$0"
  source <(nodenv init -)
  $0 "$@"
}

rbenv() {
  unfunction "$0"
  source <(rbenv init -)
  $0 "$@"
}

goenv() {
  unfunction "$0"
  source <(goenv init -)
  $0 "$@"
}

export LANG=en_US.UTF-8
export ANYENVPATH="$HOME/.anyenv/bin:$PATH"
export HOMEBREWPATH=/opt/homebrew/bin:$PATH
export PYTHONPATH=/opt/homebrew/opt/python@3.9/libexec/bin:$PATH
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export STARSHIP_CONFIG="$HOME/.zsh/starship/config.toml"
