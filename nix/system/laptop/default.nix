{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./drv/nvidia.nix # Nvidia drivers
    ./extra
    ./net
    ./sec
    ./srv
    ./sys
    ./temp
    ./usr

    #../../wm/xmonad

    ./hardware-configuration.nix # Include the results of the hardware scan.
  ];

  # System packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    git # Git must be installed before flakes.
    wget
    curl
    pulseaudio # needed by Pipewire
  ];
}
