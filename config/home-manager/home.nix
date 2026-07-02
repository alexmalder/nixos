{ config, pkgs, ... }:

{
  home.username = "alexmalder";
  home.homeDirectory = "/home/alexmalder"; # use "/Users/YOUR_USERNAME" on macOS
  #home.stateVersion = "26.11"; # Match to the Nixpkgs version you are using
  home.stateVersion = "26.05";

  #home.enableNixpkgsReleaseCheck = false;
  #programs.home-manager.enable = true;

  home.packages = [

    # console utilities
    pkgs.wget
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
    pkgs.ctop
    pkgs.k9s
    pkgs.dpkg

    # dev
    pkgs.yaml-language-server
    pkgs.bash-language-server

    # golang
    pkgs.go
    # Optional: tools like gopls (language server) or gotools
    pkgs.gopls 
    pkgs.gotools
    # fonts
    pkgs.nerd-fonts.iosevka-term
    pkgs.nerd-fonts.ubuntu

    # gui apps
    pkgs.telegram-desktop
    pkgs.floorp-bin
    pkgs.google-chrome
    pkgs.obsidian
    pkgs.vscode
    pkgs.zed-editor

    # kde user apps
    pkgs.kdePackages.kdenlive
    pkgs.kdePackages.ktorrent
    pkgs.kdePackages.kmail
    pkgs.kdePackages.kdepim-runtime # Required for Akonadi agents and mail sync
    pkgs.kdePackages.akonadi        # Core email database and control service

    # music
    pkgs.bitwig-studio5
  ];
}
