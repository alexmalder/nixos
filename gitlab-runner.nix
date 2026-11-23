{ config, pkgs, ... }:

{
  age.secrets = {
    gitlab-runner-token.file = ./secrets/gitlab-runner-token.age;
    gitlab-homeserver-crt.file = ./secrets/homeserver.crt.age;
    gitlab-homeserver-key.file = ./secrets/homeserver.key.age;
  };

  # Expose the decrypted cert and key to the DynamicUser runner service
  systemd.services.gitlab-runner.serviceConfig.LoadCredential = [
    "homeserver.crt:${config.age.secrets.gitlab-homeserver-crt.path}"
    "homeserver.key:${config.age.secrets.gitlab-homeserver-key.path}"
  ];

  # Enable Docker
  virtualisation.docker.enable = true;

  # Add gitlab-runner to the docker group (and wheel if needed)
  users.users.gitlab-runner.isSystemUser = true;
  users.groups.gitlab-runner = {};
  users.users.gitlab-runner.group = "gitlab-runner";
  users.users."gitlab-runner".extraGroups = [ "docker" "wheel" ];

  # Configure GitLab Runner with the Docker executor
  services.gitlab-runner = {
    enable = true;
    extraPackages = with pkgs; [
      sudo
      git
      bash
    ];
    services = {
      my-nixos-runner = {
        authenticationTokenConfigFile = config.age.secrets.gitlab-runner-token.path;
        executor = "docker";
        dockerImage = "alpine:latest"; # Default fallback image if none is specified in .gitlab-ci.yml

        # Bind-mount the credential files into every Docker job container
        dockerVolumes = [
          "/run/credentials/gitlab-runner.service/homeserver.crt:/etc/gitlab-runner/certs/homeserver.crt:ro"
          "/run/credentials/gitlab-runner.service/homeserver.key:/etc/gitlab-runner/certs/homeserver.key:ro"
        ];

        # Instruct Git inside the job container to use the mounted client cert/key
        environmentVariables = {
          GIT_SSL_CERT = "/etc/gitlab-runner/certs/homeserver.crt";
          GIT_SSL_KEY = "/etc/gitlab-runner/certs/homeserver.key";
        };

        # Pass mTLS flags to gitlab-runner register so they are written to config.toml
        registrationFlags = [
          "--tls-cert-file=/run/credentials/gitlab-runner.service/homeserver.crt"
          "--tls-key-file=/run/credentials/gitlab-runner.service/homeserver.key"
        ];

      };
    };
  };
}

