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
    kubernetes-helm
    argocd
    nerdctl
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

    addons.dns = {
      enable = true;
      # run this command for extract digest and hash
      # nix run nixpkgs#nix-prefetch-docker -- --image-name git.homeserver.local/devopsfaith/coredns --image-tag 1.15.0 --arch amd64 --os linux
      corednsImage = pkgs.dockerTools.pullImage {
        #imageName = "coredns/coredns";
        #imageDigest = "sha256:0a9d8c8ddf34347eb59aad9a8784f0710de88d6d112726d11d271f9bc6daca26";
        #hash = "sha256-VgorHUi+sJG1zMN+pLjedYbG3owsv3J7IZSM4ggr1X8=";

        imageName = "git.homeserver.local/devopsfaith/coredns";
        imageDigest = "sha256:3429e3bbffb1e839470c4a3541d4d78aca84a1394c75a539d0200c58c63196ac";
        hash = "sha256-3OPj3i3TzYQM7MOO+8+oBt83nsZi2LIs7gXojk8V1KQ=";

        finalImageTag = "1.15.0";
      };
    };

    # Highly recommended: Disable swap check if your NixOS machine uses swap
    kubelet.extraOpts = "--fail-swap-on=false";
  };
}

