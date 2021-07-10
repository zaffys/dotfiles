#!/usr/bin/env bash
set -ue

#--------------------------------------------------------------#
##          Functions                                         ##
#--------------------------------------------------------------#

helpmsg() {
  command echo "Usage: $0 [--help | -h]" 0>&2
  command echo ""
}

link_to_homedir() {
  command echo "backup old dotfiles..."
  if [ ! -d "$HOME/.dotfiles_backup" ];then
    command echo "$HOME/.dotfiles_backup not found. Auto Make it"
    command mkdir "$HOME/.dotfiles_backup"
  fi

  local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
  local dotdir=$(dirname ${script_dir})
  if [[ "$HOME" != "$dotdir" ]];then
    for f in $dotdir/.??*; do
      [[ `basename $f` == ".git" || `basename $f` == ".DS_Store" ]] && continue
      if [[ -e "$HOME/.dotfiles_backup/`basename $f`" ]];then
        continue
      fi
      if [[ -e "$HOME/`basename $f`" ]];then
        command mv "$HOME/`basename $f`" "$HOME/.dotfiles_backup"
      fi
      command ln -snf $f $HOME
    done
  else
    command echo "same install src dest"
  fi
}

#--------------------------------------------------------------#
##          Main                                              ##
#--------------------------------------------------------------#

IS_INSTALL="true"

while [ $# -gt 0 ];do
  case ${1} in
    --debug|-d)
      set -uex
      ;;
    --help|-h)
      helpmsg
      exit 1
      ;;
    install)
      IS_INSTALL="true"
      ;;
    *)
      ;;
  esac
  shift
done

if [[ "$IS_INSTALL" = true ]];then
  link_to_homedir
  command echo ""
  command echo "#####################################################"
  command echo -e "$(basename $0) install success!!!"
  command echo "#####################################################"
  command echo ""
fi

