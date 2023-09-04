{ pkgs, inputs, ... }: {

  home.file."~/${username}/hyprland.conf".source = ./hyprland.conf;
  programs.hyprland = {
    enable = true;
    #package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    enableNvidiaPatches = true;
    #xwayland = {
      #enable = true;
      #hidpi = true;
    #};
  };

  # Environment variable for electron Wayland apps.
  environment.variables = {
    NIXOS_OZONE_WL = "1";
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
      #xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk # GTK portal needed to make gtk apps happy.
      ];

      # REMOVE?
      #xdgOpenUsePortal = true;
      #wlr.enable = true; # Adds xdg-desktop-portal-wlr into extraPortals.
      #wlr.settings = ;
    };
  };

  # Polkit
  security.polkit = {
    enable = true;
    #debug = true;
    #extraConfig = ''
    #''
  };

  # Extra programs
  programs.wshowkeys.enable = true; # Show keystrokes in wayland.

  # Packages to install
  # See more https://wiki.hyprland.org/Useful-Utilities/Must-have/
  environment.systemPackages = with pkgs; [

    # CUSTOMIZATION - WAYLAND - NOT USED
    #nwg-bar
    #nwg-menu
    #nwg-panel
    #nwg-drawer
    #nwg-wrapper
    #nwg-launchers
    #waybar
    #swaylock-effects
    flameshot ksnip sway-contrib.grimshot

    # Apps
    eww-wayland # status bar
    wofi #bemenu
    gtklock # lock screen
    swayidle # idle daemon
    imv # image viewer
    nsxiv # image viewer (X11)
    grim slurp # simple screenshot
    mako libnotify # notification daemon
    wlogout
    pass-wayland # password manager

    wpaperd
    swww # wallpaper daemon
    mpvpaper # video wallpaper

    wl-clipboard
    wdisplays #wlr-randr #kanshi
    brightnessctl #brillo
    xorg.xlsclients # check for apps running on xwayland

    # Must have
    polkit libsForQt5.polkit-kde-agent # Authentication Agent
    libsForQt5.qt5.qtwayland qt6.qtwayland # Qt Wayland Support

  ];

}
