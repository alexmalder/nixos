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

  programs.git = {
    enable = true;
    settings = {
      user.name = "alexmalder";
      user.email = "alexmalder@outlook.com";
      init.defaultBranch = "main";
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
    kubernetes-helm
    hugo
    p7zip
    calibre
    gcc
    gnumake

    # dev
    yaml-language-server
    bash-language-server
    markdownlint-cli

    # golang
    go
    gopls 
    gotools
    # python
    virtualenv
    # windows installer
    woeusb-ng
    ntfs3g

    # dev
    nodejs_26
    yaml-language-server
    bash-language-server
    markdownlint-cli

    # gui apps
    telegram-desktop
    google-chrome
    floorp-bin
    vscode
    freelens-bin
    bluemail

    # kde user apps
    kdePackages.kate
    kdePackages.kdenlive
    kdePackages.ktorrent
    kdePackages.okular
    kdePackages.filelight
    kdePackages.kfind
    kdePackages.kmail
    kdePackages.kaccounts-integration
    kdePackages.kaccounts-providers
    kdePackages.kmail-account-wizard

    # fonts
    helvetica-neue-lt-std    
    nerd-fonts.iosevka-term
  ];
}
