{ config, pkgs, ... }:

{

  # Wine configuration and packages
  # See more at 

  # Support for 32-bit apps. 
  # Only supported for nvidia and also Mesa.
  hardware.opengl.driSupport32Bit = true;

  # Packages to install
  environment.systemPackages = with pkgs; [ 

    # Frontends for Wine.
    bottles #bottles-unwrapped
    #q4wine

    # WINE
    #wine-wayland
    #wine-staging # With staging patches
    #wine # Support 32-bit only
    #wine64 # Support 64-bit only

    # WINE extras
    wineasio
    winetricks

    # Support both 32- and 64-bit applications.
    wineWowPackages.waylandFull # With experimental Wayland support.
    #wineWowPackages.wayland # With experimental Wayland support.
    #wineWowPackages.unstableFull
    #wineWowPackages.unstable
    #wineWowPackages.stagingFull
    #wineWowPackages.staging
    #wineWowPackages.stableFull
    #wineWowPackages.stable
    #wineWowPackages.minimal
    #wineWowPackages.full
    #wineWowPackages.base
    #wineWowPackages.fonts # Microsoft replacement fonts by the Wine project.

    # Support 64-bit only
    #wine64Packages.waylandFull
    #wine64Packages.wayland
    #wine64Packages.unstableFull
    #wine64Packages.unstable
    #wine64Packages.stagingFull
    #wine64Packages.staging
    #wine64Packages.stableFull
    #wine64Packages.stable
    #wine64Packages.minimal
    #wine64Packages.base
    #wine64Packages.fonts # Microsoft replacement fonts by the Wine project.

    # Support 32-bit only
    #winePackages.waylandFull
    #winePackages.wayland
    #winePackages.unstableFull
    #winePackages.unstable
    #winePackages.stagingFull
    #winePackages.staging
    #winePackages.stableFull
    #winePackages.stable
    #winePackages.minimal
    #winePackages.base
    #winePackages.fonts # Microsoft replacement fonts by the Wine project.
  ];
}
