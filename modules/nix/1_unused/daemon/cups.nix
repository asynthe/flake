{ config, pkgs, username, ... }: {

  # See more at https://nixos.wiki/wiki/Printing

  # Local print service.
  users.users.${username}.extraGroups = [ "cups" ];
  services.printing = {
    enable = true;
    drivers = [ pkgs.hplipWithPlugin ];
  };

  # Autodiscovery of network printers
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
