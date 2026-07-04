{ config, pkgs, ... }:

{
  home.username = "alexmalder";
  home.homeDirectory = "/home/alexmalder"; # use "/Users/YOUR_USERNAME" on macOS
  #home.stateVersion = "26.11"; # Match to the Nixpkgs version you are using
  home.stateVersion = "26.05";

  #home.enableNixpkgsReleaseCheck = false;
  #programs.home-manager.enable = true;

  home.packages = with pkgs; [

    # console utilities
    wget
    zsh
    fish
    nnn
    neovim
    zoxide 
    htop
    tree
    btop
    fzf
    ripgrep
    eza
    pass
    nmap
    ncdu
    sshpass
    ctop
    k9s
    dpkg
    # building qtcurve ...
    gnumake
    cmakeMinimal
    gcc16
    pkg-config

    # dev
    yaml-language-server
    bash-language-server

    # golang
    go
    # Optional: tools like gopls (language server) or gotools
    gopls 
    gotools
    # fonts
    nerd-fonts.iosevka-term
    nerd-fonts.ubuntu

    # gui apps
    telegram-desktop
    floorp-bin
    google-chrome
    obsidian
    vscode
    thunderbird

    # kde user apps
    kdePackages.kate
    kdePackages.kdenlive
    kdePackages.ktorrent
    kdePackages.kdepim-runtime # Required for Akonadi agents and mail sync
    kdePackages.akonadi        # Core email database and control service

    # music
    bitwig-studio5

  ];
}
