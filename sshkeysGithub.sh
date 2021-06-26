#! /bin/bash

read -p "Enter your email: " email 
ssh-keygen -t ed25519 -C "$email" -N "" -f ~/.ssh/id_rsa
echo  "Cool, Now add your SSH Key onto github https://github.com/settings/ssh/new"
