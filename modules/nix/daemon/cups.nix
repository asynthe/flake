{ config, pkgs, username, ... }: {

  # See more at https://nixos.wiki/wiki/Printing

  # Local print service.
  services.printing.enable = true;
  users.users.${username}.extraGroups = [ "cups" ];

  # Autodiscovery of network printers
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  #environment.systemPackages = builtins.attrValues {
    #inherit (pkgs)
    #hplip
    #;
  #};

}
