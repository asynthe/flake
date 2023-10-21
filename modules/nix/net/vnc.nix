{ config, pkgs, ... }: {

  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)
      remmina
      ;
  };
}
