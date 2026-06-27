{ config, pkgs, ... }:

{
  home.username = "alexmalder";
  home.homeDirectory = "/home/alexmalder"; # use "/Users/YOUR_USERNAME" on macOS
  home.stateVersion = "26.11"; # Match to the Nixpkgs version you are using
  home.enableNixpkgsReleaseCheck = false;

  programs.home-manager.enable = true;

  home.packages = [

    # console utilities

    pkgs.zsh
    pkgs.fish
    pkgs.nnn
    pkgs.neovim
    pkgs.htop
    pkgs.tree
    pkgs.btop
    pkgs.fzf
    pkgs.ripgrep
    pkgs.eza
    pkgs.pass

    # gui apps

    # pkgs.ardour
    pkgs.qtractor
    pkgs.qjackctl
    pkgs.calf
    pkgs.kdePackages.kdenlive
    pkgs.telegram-desktop
    pkgs.floorp-bin
    pkgs.google-chrome
    pkgs.obsidian
    pkgs.postman
  ];
}
