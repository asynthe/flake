{ config, pkgs, ... }: {

  imports = [
    
    ./basic.nix # Basic core server configuration.
    ../nix_settings.nix # Nix daemon configuration
    ../user.nix # User configuration

    # Is this really needed on a flake?
    ./hardware-configuration.nix # Include the results of the hardware scan.
  ];

}
