{ config, ... }: {

  imports = [

    ./home.nix # Home Manager configuration and settings.
    ./list.nix # List of packages to enable.

  ];
}
