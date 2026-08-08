{ config, pkgs, ... }:

{
  home.username = "alexmalder";
  home.homeDirectory = "/home/alexmalder"; # use "/Users/YOUR_USERNAME" on macOS
  home.stateVersion = "26.05";

  programs.obsidian = {
    enable = true;
    package = pkgs.obsidian.override {
      electron = pkgs.electron_39; # or your specific electron 39 derivation
    };
  };


  home.packages = with pkgs; [
    # console utilities
    wget
    zsh
    fish
    tmux
    neovim
    nnn
    zoxide 
    htop
    btop
    tree
    fzf
    ripgrep
    eza
    gnupg
    pass
    nmap
    ncdu
    sshpass
    ctop
    k9s
    dpkg
    gparted
    kubectl
    hugo
    woeusb-ng
    ntfs3g

    # dev
    yaml-language-server
    bash-language-server
    markdownlint-cli

    # golang
    go
    # Optional: tools like gopls (language server) or gotools
    gopls 
    gotools
    # python
    virtualenv
    xray

    # dev
    yaml-language-server
    bash-language-server
    markdownlint-cli

    # golang
    go
    # Optional: tools like gopls (language server) or gotools
    gopls 
    gotools

    # gui apps
    kitty
    telegram-desktop
    google-chrome
    vscode
    bluemail
    libreoffice
    qtractor

    # kde user apps
    kdePackages.kate
    kdePackages.kdenlive
    kdePackages.ktorrent
    kdePackages.okular
    kdePackages.filelight
    kdePackages.kgpg
    kdePackages.kfind
    # kde mail
    #kdePackages.kmail
    #kdePackages.kmail-account-wizard
    #kdePackages.akonadi
  ];

}
