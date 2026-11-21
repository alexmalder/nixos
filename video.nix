{ config, pkgs, ... }:

{
  # 1. Allow unfree packages (required for proprietary drivers)
  nixpkgs.config.allowUnfree = true;
  
  # 2. Accept the Nvidia license agreement
  nixpkgs.config.nvidia.acceptLicense = true;

  # 3. Tell Xserver to use the Nvidia driver
  services.xserver.videoDrivers = [ "nvidia" ];

  # 4. Enable hardware graphics acceleration (OpenGL / Vulkan)
  hardware.graphics = {
    enable = true;
    enable32Bit = true; # Highly recommended for 32-bit gaming/Steam
  };

  # 5. Configure the specific Nvidia 470 legacy driver package
  hardware.nvidia = {
    # Modesetting is required for modern desktop environments
    modesetting.enable = true;

    # The 470 driver does NOT support the open-source kernel module
    open = false;

    # Enable the Nvidia settings menu (nvidia-settings)
    nvidiaSettings = true;

    # Force NixOS to pin the legacy 470 driver
    package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
  };

}
