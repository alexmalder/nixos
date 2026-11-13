{ config, pkgs, ... }:

{
  # Enable networking
  networking.networkmanager.enable = true;

  # Setup hostname
  networking.hostName = "devopsfaith-desktop"; # Define your hostname.

  # Enables wireless support via wpa_supplicant.
  # networking.wireless.enable = true;  

  # Setup /etc/hosts
  networking.hosts = {
    # ingress
    "192.168.0.100" = [ 
      "argocd.homeserver.local" 
      "grafana.homeserver.local"
      "kubernetes.default.svc"
      "vminsert.homeserver.local"
    ];
    # haproxy
    "192.168.0.90" = [
      "git.homeserver.local"
      "loki.homeserver.local"
    ];
  };

  # Open ports in the firewall.
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      # ssh
      22
      # haproxy
      80
      443
      # kubernetes
      6443 
      10250
      # loki
      3100
      # node exporter
      9000
      # systemd exporter
      9558
    ];
  };

  # networking.firewall.allowedUDPPorts = [ ... ];
  
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Configure network proxy if necessary
  #networking.proxy.default = "socks5://127.0.0.1:10808/";
  #networking.proxy.noProxy = "127.0.0.1,localhost,homeserver.local";
}
