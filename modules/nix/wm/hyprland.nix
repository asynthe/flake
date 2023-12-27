{ config, inputs, pkgs, ... }: {

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    #enableNvidiaPatches = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = builtins.attrValues {
      inherit
        (pkgs)
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk # GTK portal needed to make gtk apps happy.
        ;
    };
  };

  # Polkit
  security.polkit = {
    enable = true;
    #debug = true;
    #extraConfig = ''
    #''
  };

}
