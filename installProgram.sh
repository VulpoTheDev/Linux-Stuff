#!/bin/bash

echo "Please make sure you're running this with root!"
sudo pacman -Syu --noconfirm

# Installs your Dev Stuff & Utils with pacman
packages=(
  vim
  neovim
  base-devel
  obs-studio
  flameshot
  yay
  jre8-openjdk-headless
  jre8-openjdk
  jdk8-openjdk
  openjdk8-doc
  openjdk8-src
  firefox-developer-edition
  go
  python-pip
  python
)

sudo pacman -S ${packages[@]} --noconfirm

# Install nvm and latest version of Node.js
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
nvm install stable
nvm alias default stable

# Clones and makepkg stuff
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -sic
cd ..
sudo rm -rd ./yay

yay_packages=(
  discord-canary
  mongodb-bin
  gitkraken
  mongodb-compass
  jetbrains-toolbox
  visual-studio-code-insiders-bin
)

yay -Syu ${yay_packages[@]}

# Starts & Enables MongoDB
sudo systemctl start mongodb
sudo systemctl enable mongodb

# Install Yarn and Global NPM Packages
npm_packages=(
  yarn
  typescript
  prettier
  eslint
)

sudo npm i -g ${npm_packages[@]}

while true; do
  read -p "Done, restart computer? (y/n)" yn
  case $yn in
  [yY]*)
    echo "Restarting computer"
    shutdown -n now
    ;;
  [nN]*)
    echo "Exiting"
    exit
    ;;
  *) echo "Please enter 'y' or 'n'!" ;;
  esac
done
