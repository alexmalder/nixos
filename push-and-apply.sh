# simple copy and apply script

cp config/home-manager/home.nix $HOME/.config/home-manager/home.nix

sudo cp etc/nixos/configuration.nix /etc/nixos/configuration.nix
sudo cp etc/nixos/hardware-configuration.nix /etc/nixos/hardware-configuration.nix

sudo nixos-rebuild switch

nix-shell -p home-manager --run "home-manager switch"
