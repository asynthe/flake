{ config, pkgs, ... }: {

  # Wine configuration and packages
  # See more at https://nixos.wiki/wiki/Wine

  # Support for 32-bit apps.
  # Only supported for nvidia and also Mesa.
  hardware.opengl.driSupport32Bit = true;

  # Packages to install
  environment.systemPackages = builtins.attrValues {
    inherit (pkgs)

      # Frontends for Wine. 
      bottles #bottles-unwrapped
      #q4wine
      
      # WINE
      wine-wayland
      #wine-staging # With staging patches
      #wine # Support 32-bit only
      #wine64 # Support 64-bit only
      
      # WINE extras
      wineasio
      winetricks
      ;

    # Wine build that support both 32 and 64-bit applications.
    inherit (pkgs.wineWowPackages) 

      waylandFull # With experimental Wayland support.
      #wayland # With experimental Wayland support.
      #unstableFull
      #unstable
      #stagingFull
      #staging
      #stableFull
      #stable
      #minimal
      #full
      #base
      #fonts # Microsoft replacement fonts by the Wine project.
      ;

    # Wine build that supports 64-bit only.
    inherit (pkgs.wine64Packages) 
      #waylandFull
      #wayland
      #unstableFull
      #unstable
      #stagingFull
      #staging
      #stableFull
      #stable
      #minimal
      #base
      #fonts # Microsoft replacement fonts by the Wine project.
      ;

    # Wine build that supports 32-bit only.
    inherit (pkgs.winePackages) 
      #waylandFull
      #wayland
      #unstableFull
      #unstable
      #stagingFull
      #staging
      #stableFull
      #stable
      #minimal
      #base
      #fonts # Microsoft replacement fonts by the Wine project.
      ;
  };
}
