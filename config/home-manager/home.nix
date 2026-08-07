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
    # fonts
    helvetica-neue-lt-std    
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
    # fonts
    helvetica-neue-lt-std

    # gui apps
    kitty
    telegram-desktop
    google-chrome
    obsidian
    vscode
    bluemail
    qtractor

    # kde user apps
    kdePackages.kate
    kdePackages.kdenlive
    kdePackages.ktorrent
    kdePackages.okular
    kdePackages.filelight
    kdePackages.kgpg
    # kde mail
    #kdePackages.kmail
    #kdePackages.kmail-account-wizard
    #kdePackages.akonadi
  ];
}
