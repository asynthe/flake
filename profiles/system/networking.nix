{ config, lib,  ... }:
with lib;
let
    cfg = config.system.networking;
in {
    options.system.networking.type = mkOption {
        type = types.str;
        default = "simple";
        description = "Enable and set up a Network Manager configuration.";
    };

    config = mkMerge [
        (mkIf (cfg.type == "simple") {
            networking.networkmanager.enable = true;
        })
        (mkIf (cfg.type == "laptop") {
            networking.networkmanager = {
                enable = true;
                ethernet.macAddress = "random";
                wifi.scanRandMacAddress = true;
                wifi.macAddress = "random"; # permanent, preserve, random, stable.
            };
        })

    ];
}
