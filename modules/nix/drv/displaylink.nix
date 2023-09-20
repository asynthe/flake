{
  config,
  pkgs,
  ...
}: {
  # Displaylink driver for multiple monitors
  # See more at https://nixos.wiki/wiki/Displaylink

  # Remember to add the drivers to the nix store
  # https://www.synaptics.com/products/displaylink-graphics/downloads/ubuntu

  services.xserver = {
    videoDrivers = ["displaylink" "modesetting"];
    #sessionCommands = ''
    #${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource 2 0
    #'';
  };

  environment.systemPackages = builtins.attrValues {
    inherit 
      (pkgs)
      displaylink
      ;
  };
}
