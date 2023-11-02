{ config, pkgs, ... }: {

  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)
      xmonad-with-packages
      ;
  };

}
