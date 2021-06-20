#!/bin/bash

# If you're not root then kill the script
if [ $UID -ne 0 ]
then
	echo "You must run this script WITH SUDO, NOT AS THE ROOT USER!" && echo
	exit
fiif []

sudo pacman -Syu --noconfirm

# Installs your Dev Stuff & Utils with pacman
sudo pacman -S vim nvim nodejs npm base-devel obs-studio flameshot yay  jre8-openjdk-headless jre8-openjdk jdk8-openjdk openjdk8-doc openjdk8-src --noconfirm

# Clones and makepkg stuff
sudo yay install visual-studio-code-insiders-bin discord-canary mongodb-bin gitkraken spotify mongodb-compass  jetbrains-toolbox firefox-developer-edition --noconfirm


# Starts & Enables MongoDB

sudo systemctl start mongodb
sudo systemctl enable mongodb

# Install Yarn and Global NPM Packages
sudo npm i -g yarn typescript prettier eslint

echo "Done, Now go restart your Computer!"