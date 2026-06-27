#!/run/current-system/sw/bin/bash

# nix general config

diff -r /etc/nixos etc/nixos

# nix packages settings
diff -r $HOME/.config/nixpkgs/config.nix ./config/nixpkgs/config.nix

# nix home-manager config
diff -r $HOME/.config/home-manager/home.nix ./config/home-manager/home.nix

# dotfiles
diff -r $HOME/.config/nvim ./config/nvim
diff -r $HOME/.config/fish/config.fish ./config/fish/config.fish
