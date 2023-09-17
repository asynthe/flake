{
  config,
  pkgs,
  ...
}: {
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk # GTK portal needed to make gtk apps happy.
    ];
  };

  # Polkit
  security.polkit = {
    enable = true;
    #debug = true;
    #extraConfig = ''
    #''
  };
}
