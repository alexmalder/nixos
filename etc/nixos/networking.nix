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
    "192.168.0.90" = [ 
      "argocd.homeserver.local" 
      "prometheus.homeserver.local"
      "grafana.homeserver.local"
      "alertmanager.homeserver.local"
    ];
  };

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    22
    80
    443
    6443 
    10250
  ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Configure network proxy if necessary
  #networking.proxy.default = "socks5://127.0.0.1:1080/";
  #networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

}
