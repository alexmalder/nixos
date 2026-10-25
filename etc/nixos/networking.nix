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
    "192.168.0.91" = [ 
      "argocd.homeserver.local" 
      "vicrotia-metrics.homeserver.local"
      "grafana.homeserver.local"
      "kubernetes.default.svc"
    ];
  };

  # Open ports in the firewall.
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      22
      80
      443
      # 6443 
      # 8888
      # 10250
    ];
  };

  # networking.firewall.allowedUDPPorts = [ ... ];
  
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Configure network proxy if necessary
  #networking.proxy.default = "socks5://127.0.0.1:1080/";
  #networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

}
