#!/bin/bash

asdf plugin add nodejs

# asdf list all nodejs | grep lts
asdf install nodejs lts-hydrogen
asdf global nodejs lts-hydrogen
asdf local nodejs lts-hydrogen

npm install -g yarn
npm install -g alacritty-themes
npm install -g @upstash/cli

asdf plugin add pnpm
asdf install pnpm 7.29.1
asdf global pnpm 7.29.1
asdf local pnpm 7.29.1

export PNPM_HOME=$HOME/.asdf/installs/pnpm/7.29.1
pnpm config set global-bin-dir $PNPM_HOME/bin
pnpm config list

# pnpm install -g yarn
# pnpm install -g alacritty-themes

asdf plugin add direnv
asdf direnv setup --shell zsh --version latest
asdf global direnv 2.32.1
asdf local direnv 2.32.1

asdf plugin add rust
RUST_WITHOUT=rust-docs,rust-other-component asdf install rust 1.68.0
asdf global rust 1.68.0
asdf local rust 1.68.0

asdf plugin add golang
asdf install golang 1.20.3
asdf global golang 1.20.3
asdf local golang 1.20.3

git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
git sparse-checkout add patched-fonts/JetBrainsMono

curl -s "https://get.sdkman.io" | bash
sdk install java 11.0.18-tem
sdk install java 17.0.6-tem
sdk install maven
sdk install quarkus 2.16.6.Final

# install lunar vim
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

# for nvim plugin install
# git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Create a cli shortcut for Sublime Text
# ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

# mkdir -p ~/.local/share/fonts
# cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

git clone https://github.com/ronniedroid/getnf.git
cd getnf
./install.sh

# then run getnf -k and select the fonts from the list to be installed
