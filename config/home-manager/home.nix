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
    # win
    woeusb
    ntfs3g
    # python
    virtualenv

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
    nerd-fonts.iosevka-term
    nerd-fonts.ubuntu

    # gui apps
    kitty
    telegram-desktop
    floorp-bin
    google-chrome
    obsidian
    vscode
    qtractor
    #libreoffice-qt
    #reaper

    # kde user apps
    kdePackages.kate
    kdePackages.partitionmanager
    kdePackages.kdenlive
    kdePackages.ktorrent
    kdePackages.okular
    kdePackages.filelight
    kdePackages.konqueror
    # kde mail
    kdePackages.kmail
    kdePackages.kmail-account-wizard
    kdePackages.akonadi
    
  ];
}
