{ config, pkgs, ... }: {

  services.flatpak.enable = true;
  fonts.fontDir.enable = true; # Fix for flatpak not finding system installed fonts.
  xdg.portal = {
    enable = true;
    extraPortals = builtins.attrValues {
      inherit
        (pkgs)
	xdg-desktop-portal-gtk
	;
    };
  };
}
