{ config, pkgs, ... }:

let
  # For single-node setups with easyCerts
  # This address setup manually
  kubeMasterIP = "192.168.0.90";
  kubeMasterHostname = "api.kube";
  kubeMasterAPIServerPort = 6443;
in {
  # 1. Resolve the master hostname locally
  networking.extraHosts = "${kubeMasterIP} ${kubeMasterHostname}";

  # 2. Install essential administration tools
  environment.systemPackages = with pkgs; [
    kubectl
    kubernetes
  ];

  # 3. Enable vanilla Kubernetes services
  services.kubernetes = {
    roles = [ "master" "node" ]; # Combines control plane and worker
    masterAddress = kubeMasterHostname;
    apiserverAddress = "https://${kubeMasterHostname}:${toString kubeMasterAPIServerPort}";
    easyCerts = true;

    apiserver = {
      securePort = kubeMasterAPIServerPort;
      advertiseAddress = kubeMasterIP;
    };

    # Automatically provision CoreDNS into the cluster
    addons.dns.enable = true;

    # Highly recommended: Disable swap check if your NixOS machine uses swap
    kubelet.extraOpts = "--fail-swap-on=false";
  };
}

