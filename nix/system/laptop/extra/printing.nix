{ config, pkgs, ... }:

# See https://nixos.wiki/wiki/Printing
# services.printing.drivers is the appropiate driver for your printer. Commonly used driver packages include:
# pkgs.gutenprint
# pkgs.gutenprintBin
# pkgs.hplip
# pkgs.hplipWithPlugin

{

  services.printing = {
    enable = true;
    #drivers = ...;
  };
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  # for a WiFi printer
  services.avahi.openFirewall = true;

}
