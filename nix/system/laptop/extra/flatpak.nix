{ config, pkgs, ... }:

{

  # FLATPAK
  services.flatpak.enable = true;
  fonts.fontDir.enable = true; # So that Flatpak apps find system fonts

}
