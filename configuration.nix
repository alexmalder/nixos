# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ 
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./networking.nix
      ./video.nix
      ./loki.nix
      ./gitea.nix
      ./haproxy.nix
      ./kubernetes-single-node.nix
      ./vector.nix
      #./gitlab-runner.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable X11 and i3
  services.xserver = {
    enable = true;
    dpi = 144;
    desktopManager.xterm.enable = false;
    displayManager.defaultSession = "none+i3";
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu       # Default application launcher (or use rofi)
        i3status    # Default status bar
        i3lock      # Screen locker
        i3blocks    # Optional block-based status bar
      ];
    };
  };

  environment.variables = {
    # Scales GTK 3/4 UI elements (use integer 1 or 2; 1 works well if Xft.dpi is 120-144)
    GDK_SCALE = "1"; 
    # Counter-scales GTK fonts so they don't double-scale with Xft.dpi
    GDK_DPI_SCALE = "1.0"; 
    # Scales Qt5 and Qt6 apps automatically based on Xft.dpi
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_ENABLE_HIGHDPI_SCALING = "1";
    QT_SCALE_FACTOR = "1.5";
    # Increases mouse cursor size (default is 24)
    XCURSOR_SIZE = "32"; 
  };

  # Recommended for i3blocks to find scripts in /libexec
  environment.pathsToLink = [ "/libexec" ];

  # Recommended so GTK/Firefox apps persist settings like dialog sizes
  programs.dconf.enable = true;


  # Enable the x11 and plasma with autologin
  #services.xserver.enable = true;
  #services.displayManager.sddm.enable = true;
  #services.desktopManager.plasma6.enable = true;
  #services.displayManager.autoLogin.enable = true;
  #services.displayManager.autoLogin.user = "alexmalder";
  #services.displayManager.defaultSession = "plasmax11";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
    options = "grp:win_space_toggle";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."alexmalder" = {
    isNormalUser = true;
    description = "alexmalder";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  home-manager.users."alexmalder" = { pkgs, ... }: {
    home.stateVersion = "26.05";
    xdg.configFile = {
      "nvim" = {
        source = ./dotfiles/config/nvim;
        recursive = true;
      };
      "tmux" = {
        source = ./dotfiles/config/tmux;
        recursive = true;
      };
      "qutebrowser/config.py".source = ./dotfiles/config/qutebrowser/config.py;
      "kitty/kitty.conf".source = ./dotfiles/config/kitty/kitty.conf;
      "i3/config".source = ./dotfiles/config/i3/config;
      "i3status/config".source = ./dotfiles/config/i3status/config;
      "rofi/config.rasi".source = ./dotfiles/config/rofi/config.rasi;
      "picom/picom.conf".source = ./dotfiles/config/picom/picom.conf;
    };
    home.file = {
      ".zshrc".source = ./dotfiles/.zshrc;
      ".local/bin" = {
        source = ./dotfiles/bin;
        recursive = true;
      };
    };
  };


  # Install firefox.
  programs.firefox.enable = true;

  # Install partition manager
  # programs.partition-manager.enable = true;

  programs.evolution.enable = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    git
    vim
    neovim
    eza
    fzf
    ripgrep
    wget
    nnn
    dig
    tmux
    zoxide 
    htop
    btop
    tree
    jq
    yq
    pass
    nmap
    ncdu
    sshpass
    ctop
    k9s
    net-tools
    cliamp
    glow
    #go
    #gopls 
    #gotools
    #virtualenv
    #pyright
    nodejs_26
    yaml-language-server
    bash-language-server
    markdownlint-cli
    tree-sitter
    prettier

    # gui apps
    kitty
    #google-chrome
    qutebrowser
    #ardour_8
    qjackctl
    #virt-manager
    #telegram-desktop
    picom
    alsa-utils
    # i3
    lxappearance
    feh
    rofi
  ];

  fonts.packages = with pkgs; [ 
    nerd-fonts.iosevka-term
  ];

  fonts.fontconfig.defaultFonts = {
    sansSerif = [ "IosevkaTerm NFM" ];
    monospace = [ "IosevkaTerm NFM" ];
    serif = [ "IosevkaTerm NFM" ];
  };

  # Enable Zsh system-wide (required so NixOS registers it in /etc/shells)
  programs.zsh.enable = true;

  # Setup gpg agent
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

  # Bluetooth setup
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true; # Automatically turns on Bluetooth on startup
  };

  # Some features
  nix.settings.experimental-features = [ 
    "nix-command" 
    "flakes" 
  ];

  #security.pki.certificateFiles = [
  #  /etc/nixos/certs/homeserver.crt
  #];

  virtualisation.docker.enable = true;

  # services.prometheus.exporters.node = {
  #   enable = true;
  #   port = 9000;
  # };

  # services.prometheus.exporters.systemd = {
  #   enable = true;
  #   port = 9558;
  # };

  # fileSystems."/var/lib/containerd" = {
  #   device = "/dev/disk/by-uuid/74e88012-0632-4c5d-96b1-42c597c39e60";
  #   fsType = "ext4";
  #   options = [ "defaults" "nofail" ];
  # };

  boot.kernelParams = [ "systemd.swap=0" ];

  #home-manager.useGlobalPkgs = true;
  #home-manager.useUserPackages = true;
  #home-manager.backupFileExtension = "backup";
  #home-manager.users.alexmalder = import ./home.nix;
}
