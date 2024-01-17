{ config, pkgs, ... }: {

  environment.systemPackages = builtins.attrValues {
    inherit (pkgs)
    tor
    tor-browser-bundle
    arti
    ;
  };
}
