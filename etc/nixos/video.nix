{ config, pkgs, ... }:

{
  nixpkgs.config.nvidia.acceptLicense = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
    modesetting.enable = true; # Required
    powerManagement.enable = true;
    powerManagement.finegrained = false; # set to true only if supported by hybrid graphics
    #open = false;
  };

  # Enable OpenGL
  hardware.graphics.enable = true;

}
