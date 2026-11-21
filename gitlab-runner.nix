{ config, pkgs, ... }:

{
  # 1. Enable Docker
  virtualisation.docker.enable = true;

  # 2. Add gitlab-runner to the docker group (and wheel if needed)
  users.users.gitlab-runner.isSystemUser = true;
  users.groups.gitlab-runner = {};
  users.users.gitlab-runner.group = "gitlab-runner";
  users.users."gitlab-runner".extraGroups = [ "docker" "wheel" ];

  # 3. Configure GitLab Runner with the Docker executor
  services.gitlab-runner = {
    enable = true;
    extraPackages = with pkgs; [
      sudo
      git
      bash
    ];
    services = {
      my-nixos-runner = {
        authenticationTokenConfigFile = /etc/gitlab-runner/my-nixos-runner.env; 
        executor = "docker";
        dockerImage = "alpine:latest"; # Default fallback image if none is specified in .gitlab-ci.yml
      };
    };
  };
}

