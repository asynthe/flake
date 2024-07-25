{ config, lib, ... }:
with lib;
let
    cfg = config.driver;
in {
    options.driver.displaylink = mkOption {
        type = types.bool;
        default = false;
        description = "Enable drivers for Display Link connections.";
    };

    config = mkIf cfg.displaylink {
        # Displaylink driver for multiple monitors
        # See more at https://wiki.nixos.org/wiki/Displaylink

        # Remember to add the drivers to the nix store
        # https://www.synaptics.com/products/displaylink-graphics/downloads/ubuntu

        services.xserver = {
            videoDrivers = [ "displaylink" "modesetting" ];
            #sessionCommands = ''
              #${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource 2 0
            #'';
        };
    };
}
