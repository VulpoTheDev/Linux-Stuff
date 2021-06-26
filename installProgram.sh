#!/bin/bash

echo "Please make sure you're running this with root!"
sudo pacman -Syu --noconfirm

# Installs your Dev Stuff & Utils with pacman
sudo pacman -S vim neovim nodejs npm base-devel obs-studio flameshot yay  jre8-openjdk-headless visual-studio-code-insiders-bin jre8-openjdk jdk8-openjdk openjdk8-doc openjdk8-src firefox-developer-edition --noconfirm

# Clones and makepkg stuff
mkdir programs; cd programs
git clone https://aur.archlinux.org/discord-canary.git
git clone https://aur.archlinux.org/mongodb-bin.git
git clone https://aur.archlinux.org/gitkraken.git
git clone https://aur.archlinux.org/mongodb-compass.git
git clone https://aur.archlinux.org/jetbrains-toolbox.git
cd discord-canary; makepkg -sic
cd ../mongodb-bin; makepkg -sic
cd ../gitkraken; makepkg -sic
cd ../mongodb-compass; makepkg -sic
cd ../jetbrains-toolbox; makepkg -sic

# Starts & Enables MongoDB

sudo systemctl start mongodb
sudo systemctl enable mongodb

# Install Yarn and Global NPM Packages
sudo npm i -g yarn typescript prettier eslint

echo "Done, Now go restart your Computer!"
