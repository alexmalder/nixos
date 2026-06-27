{ config, pkgs, ... }:

{
  home.username = "alexmalder";
  home.homeDirectory = "/home/alexmalder"; # use "/Users/YOUR_USERNAME" on macOS
  home.stateVersion = "26.11"; # Match to the Nixpkgs version you are using
  home.enableNixpkgsReleaseCheck = false;

  programs.home-manager.enable = true;

  home.packages = [
    pkgs.zsh
    pkgs.fish
    pkgs.nnn
    pkgs.neovim
    pkgs.htop
    pkgs.tree
    pkgs.btop
    pkgs.vscode
    pkgs.obsidian
    pkgs.floorp-bin
    pkgs.chromium
    pkgs.telegram-desktop
    pkgs.postman
    pkgs.insomnia
    pkgs.fzf
    pkgs.ripgrep
  ];
}
