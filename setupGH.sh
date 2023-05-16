#!/bin/bash

read -p "Enter your email: " email
read -p "Enter your name: " name
ssh-keygen -t ed25519 -C "$email" -N "" -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub
git config --global user.email "$email"
git config --global user.name "$name"
echo "Git Name/Email is set"
echo "Cool, Now add your SSH Key onto github https://github.com/settings/ssh/new"
