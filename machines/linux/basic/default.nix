{ config, pkgs, ... }: {

  imports = [
    
    ./basic.nix # Basic core server configuration.
    ./nix_settings.nix # Nix daemon configuration.
    ./timers.nix # Enable custom systemd services / timers.

    # Is this really needed on a flake?
    ./hardware-configuration.nix # Include the results of the hardware scan.
  ];

}
