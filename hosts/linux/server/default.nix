{ config, pkgs, ... }: {

  imports = [
    
    ./modules.nix # Basic core server configuration.
    ../hardware.nix # Chosen hardware.

    # Move ?
    #../timers.nix # Enable custom systemd services / timers.
    ../../../modules/nix/nix/settings.nix # Nix daemon configuration.
    #../../../modules/nix/nix/cachix.nix # Cachix.

  ];

}
