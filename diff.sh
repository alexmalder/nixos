#!/run/current-system/sw/bin/bash


diff_cmd="diff -r --color"

# nix general config

$diff_cmd etc/nixos /etc/nixos

# nix packages settings
$diff_cmd config/nixpkgs $HOME/.config/nixpkgs

# nix home-manager config
$diff_cmd config/home-manager $HOME/.config/home-manager

# dotfiles
$diff_cmd config/nvim $HOME/.config/nvim
$diff_cmd config/fish/config.fish $HOME/.config/fish/config.fish 
