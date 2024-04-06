{ config, ... }: {

  imports = [

    ./system.nix # Configuration for the nix daemon.
    ./configuration.nix # Configuration of packages and everything else.

  ];

}
