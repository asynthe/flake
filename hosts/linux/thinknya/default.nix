{ config, pkgs, ... }: {

  imports = [

    # Core server configuration + My own configuration.
    ../server
    ./modules.nix
  ];

}
