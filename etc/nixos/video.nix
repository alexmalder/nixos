{ config, pkgs, ... }:

{
  # Nvidia setup start
  nixpkgs.config.nvidia.acceptLicense = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
    modesetting.enable = true; # Required
  };

  # Enable OpenGL
  hardware.graphics.enable = true;

  # Nvidia setup end

}
