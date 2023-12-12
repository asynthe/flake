{ config, pkgs, ... }: {

  imports = [
    
    ./basic.nix # Basic core server configuration.
    ../nix_settings.nix # Nix daemon configuration
    ../user.nix # User configuration

    # Is this really needed on a flake?
    ./hardware-configuration.nix # Include the results of the hardware scan.
  ];

  # System packages # Move to BASIC.nix
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)

      git # Git must be installed before flakes.
      wget
      curl
      pulseaudio # needed by Pipewire
      alacritty kitty # Always good to have some extra terminals.

      ;
  };
}
