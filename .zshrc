### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

zinit ice from"gh-r" as"program" atload'!eval $(starship init zsh)'
zinit light starship/starship
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit load zdharma/history-search-multi-word

### End of Zinit's installer chunk

export LANG=en_US.UTF-8

fpath=(/usr/local/share/zsh-completions $fpath)
alias -g @g='| grep'
alias -g @l='| less'
alias -g @f='--force-with-lease'

alias ssh='TERM=xterm-256color ssh'
alias dc='docker-compose'
alias da='docker attach'
alias gst='git status'
alias gb='git branch'
alias gbm='git branch -m'
alias gbd='git branch -D'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gc='git commit'
alias gg='git grep'
alias ga='git add .'
alias gd='git diff'
alias gl='git log'
alias gf='git fetch'
alias gm='git merge'
alias gca='git commit --amend'
alias gcm='git commit -m'
alias grm='git rebase master'
alias grd='git rebase develop'
alias grim='git rebase -i master'
alias grid='git rebase -i develop'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias grs='git rebase --skip'
alias gp='git push'
alias gpo='git push origin'
alias gpom='git push origin master'
alias gpod='git push origin develop'
alias gpoh='git push origin HEAD'
alias gpl='git pull'
alias gplo='git pull origin'
alias gplom='git pull origin master'
alias gplod='git pull origin develop'
alias gsw='git switch'
alias gswc='git switch -c'
alias gs='git stash'
alias gsl='git stash list'
alias gsu='git stash -u'
alias gsp='git stash pop'
alias gss='git stash save'
alias gsd='git stash drop'
alias gsc='git stash clear'
alias grsh='git reset --soft HEAD^'
alias grhh='git reset --hard HEAD^'
alias gre='git restore'
alias vi='nvim'
alias vanish='git branch | grep -v "master" | grep -v "develop" | xargs git branch -D'
alias brew="PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin brew"
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
export EDITOR=/usr/local/bin/nvim

# emacs mode
bindkey -e

# 色を使用出来るようにする
autoload -Uz colors
colors

# KEYTIMEOUTの短縮
KEYTIMEOUT=1

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# cd -<tab>で以前移動したディレクトリを表示
setopt auto_pushd

# ヒストリ(履歴)を保存、数を増やす
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 直前と同じコマンドの場合は履歴に追加しない
setopt hist_ignore_dups

# 履歴をインクリメンタルに追加
setopt inc_append_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_OPTS='--preview "bat  --color=always --style=header,grid --line-range :100 {}"'
export FZF_TMUX=1

## fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fbrm - checkout git branch (including remote branches)
fbrm() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# cd by fzf and ghq
ghq-fzf() {
  local src=$(ghq list | fzf --preview "ls -laTp $(ghq root)/{} | tail -n+4 | awk '{print \$9\"/\"\$6\"/\"\$7 \" \" \$10}'")
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N ghq-fzf
bindkey '^g' ghq-fzf
fpath+=${ZDOTDIR:-~}/.zsh_functions
