{ config, ... }: {

  imports = [

    ./home.nix # Home Manager configuration and settings.
    ./modules.nix # List of packages to enable.

  ];
}
