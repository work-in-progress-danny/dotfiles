#!/bin/bash

echo "Welcome to the Danny's Dotfiles Experience"

echo "Creating the nix home directory at ~/.config/nixpkgs"

mkdir -p ~/.config/nixpkgs

echo "symlinking dotfiles contents into the new directory"

ln ~/.dotfiles/home.nix ~/.config/nixpkgs 
ln -s ~/.dotfiles/home/ ~/.config/nixpkgs/ 
