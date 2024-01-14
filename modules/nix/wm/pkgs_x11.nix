{ config, pkgs, ... }: {

  environment.systemPackages = builtins.attrValues {
    inherit (pkgs)

    nsxiv # Image viewer
    nitrogen
    picom-jonaburg

    ;
  };

}
