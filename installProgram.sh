#!/bin/bash

echo "Please make sure you're running this with root!"
sudo pacman -Syu --noconfirm

# Installs your Dev Stuff & Utils with pacman
sudo pacman -S vim neovim nodejs npm base-devel obs-studio flameshot yay  jre8-openjdk-headless visual-studio-code-insiders-bin jre8-openjdk jdk8-openjdk openjdk8-doc openjdk8-src firefox-developer-edition go --noconfirm

# Clones and makepkg stuff
git clone https://aur.archlinux.org/yay.git
cd yay; makepkg -sic; cd ..
rm -rd ./yay
yay -Syu discord-canary mongodb-bin gitkraken mongodb-compass jetbrains-toolbox

# Starts & Enables MongoDB

sudo systemctl start mongodb
sudo systemctl enable mongodb

# Install Yarn and Global NPM Packages
sudo npm i -g yarn typescript prettier eslint

echo "Done, Now go restart your Computer!"
