{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./usr
    ../../modules
    ../../modules/wm/hyprland.nix

    #./hardware-configuration.nix # Include the results of the hardware scan.
  ];

  # System packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)
      git # Git must be installed before flakes.
      wget
      curl
      pulseaudio # needed by Pipewire
      ;
  };
}
