{
  config,
  pkgs,
  ...
}: {
  imports = [
    
    # Basic core server configuration.
    ../../modules/nix/basic.nix
    ../../modules/nix/settings.nix

    # Is this really needed on a flake?
    ./hardware-configuration.nix # Include the results of the hardware scan.
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
