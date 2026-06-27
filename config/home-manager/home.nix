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
    pkgs.zoxide
    pkgs.htop
    pkgs.tree
    pkgs.btop
    pkgs.fzf
    pkgs.ripgrep
    pkgs.eza
    pkgs.pass
    pkgs.nmap
    pkgs.ncdu
    pkgs.sshpass

    # dev
    pkgs.nodejs_26

    # golang
    pkgs.go
    # Optional: tools like gopls (language server) or gotools
    pkgs.gopls 
    pkgs.gotools

    # fonts
    pkgs.nerd-fonts.iosevka-term

    # gui apps
    pkgs.ardour
    pkgs.qtractor
    pkgs.qjackctl
    pkgs.calf
    pkgs.kdePackages.kdenlive
    pkgs.telegram-desktop
    pkgs.floorp-bin
    pkgs.google-chrome
    pkgs.obsidian
    pkgs.postman
    pkgs.vscode
  ];
}
