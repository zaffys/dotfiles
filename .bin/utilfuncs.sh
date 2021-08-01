#!/usr/bin/env bash

function print_default() {
  printf "$*\n"
}

function print_info() {
  printf "\e[1;36m$*\e[m\n" # cyan
}

function print_notice() {
  printf "\e[1;35m$*\e[m\n" # magenta
}

function print_success() {
  printf "\e[1;32m$*\e[m\n" # green
}

function print_warning() {
  printf "\e[1;33m$*\e[m\n" # yellow
}

function print_error() {
  printf "\e[1;31m$*\e[m\n" # red
}

function print_debug() {
  printf "\e[1;34m$*\e[m\n" # blue
}

function chkcmd() {
  if ! builtin command -v "$1"; then
    print_error "${1} command not found\n"
    exit
  fi
}

function yes_or_no_select() {
  local answer
  print_notice "Are you ready? [yes/no]\n"
  read -r answer
  case $answer in
  yes | y)
    return 0
    ;;
  no | n)
    return 1
    ;;
  *)
    yes_or_no_select
    ;;
  esac
}

function append_file_if_not_exist() {
  contents="$1"
  target_file="$2"
  if ! grep -q "${contents}" "${target_file}"; then
    printf "${contents}" >>"${target_file}\n"
  fi
}

function whichdistro() {
  #which yum > /dev/null && { printf redhat; return; }
  #which zypper > /dev/null && { printf opensuse; return; }
  #which apt-get > /dev/null && { printf debian; return; }
  if [ -f /etc/debian_version ]; then
    printf debian
    return
  elif [ -f /etc/fedora-release ]; then
    # printf fedora; return;
    printf redhat
    return
  elif [ -f /etc/redhat-release ]; then
    printf redhat
    return
  elif [ -f /etc/arch-release ]; then
    printf arch
    return
  elif [ -f /etc/alpine-release ]; then
    printf alpine
    return
  fi
}

function checkinstall() {
  local distro
  distro=$(whichdistro)
  if [[ $distro == "redhat" ]]; then
    sudo yum clean all
    if ! grep -i "fedora" /etc/redhat-release >/dev/null; then
      sudo yum install -y epel-release
      if [[ $(cat /etc/*release | grep '^VERSION=' | cut -d '"' -f 2 | cut -d " " -f 1) -ge 8 ]]; then
        sudo dnf install -y 'dnf-command(config-manager)'
        sudo dnf config-manager --set-enabled powertools
      fi
    fi
  fi

  local pkgs="$*"
  if [[ $distro == "debian" ]]; then
    pkgs=${pkgs//python-pip/python3-pip}
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y $pkgs
  elif [[ $distro == "redhat" ]]; then
    sudo yum install -y $pkgs
  elif [[ $distro == "arch" ]]; then
    sudo pacman -S --noconfirm --needed $pkgs
  elif [[ $distro == "alpine" ]]; then
    sudo bash -c "$(declare -f append_file_if_not_exist); append_file_if_not_exist http://dl-3.alpinelinux.org/alpine/edge/testing/ /etc/apk/repositories"
    pkgs=${pkgs//python-pip/py-pip}
    sudo apk add $pkgs
  else
    :
  fi
}

function git_clone_or_fetch() {
  local repo="$1"
  local dest="$2"
  local name
  name=$(basename "$repo")
  if [ ! -d "$dest/.git" ]; then
    print_default "Installing $name...\n"
    print_default "\n"
    mkdir -p $dest
    git clone --depth 1 $repo $dest
  else
    print_default "Pulling $name...\n"
    (
      builtin cd $dest && git pull --depth 1 --rebase origin "$(basename "$(git symbolic-ref --short refs/remotes/origin/HEAD)")" ||
        print_notice "Exec in compatibility mode [git pull --rebase]\n" &&
        builtin cd $dest && git fetch --unshallow && git rebase origin/"$(basename "$(git symbolic-ref --short refs/remotes/origin/HEAD)")"
    )
  fi
}

function mkdir_not_exist() {
  if [ ! -d "$1" ]; then
    mkdir -p "$1"
  fi
}
