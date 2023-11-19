{ config, pkgs, ... }: {

  imports = [

    # Core server configuration + My own configuration.
    ../basic
    ./genkai.nix
  ];

}
