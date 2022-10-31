fpath=(/usr/local/share/zsh-completions $fpath)
alias -g @g='| rg'
alias -g @l='| less'
alias -g @f='--force-with-lease'

alias awsume='. awsume'
alias ssh='TERM=xterm-256color ssh'
alias exa='exa -ahHl'
alias dc='docker compose'
alias da='docker attach'
alias gst='git status'
alias gb='git branch'
alias gbm='git branch -m'
alias gbd='git branch -D'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcherry='git cherry-pick'
alias gc='git commit'
alias ga='git add .'
alias gd='git diff'
alias gl='git log'
alias glo='git log --oneline'
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
alias ll='ls -l'
alias mp='find . -mindepth 1 -maxdepth 1 -type d -print -exec git --git-dir={}/.git --work-tree=$PWD/{} pull \;'
export EDITOR=/usr/local/bin/nvim
