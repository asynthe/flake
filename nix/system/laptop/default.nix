{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../wm/hyprland
    ./drv # Nvidia drivers
    ./extra
    ./srv
    ./sys
    ./usr
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
