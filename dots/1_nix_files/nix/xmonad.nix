{ config, pkgs, ... }: {

  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    #config = ;
  };

  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)
      dmenu
      xmobar
      #picom-jonaburg
      #xmonad-with-packages
      ;
  };

}
