{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.system.networking;
in {
  options.system.networking.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable Network Manager.";
  };

  options.thinkpad.networkmanager.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable Network Manager.";
  };

  config = mkMerge [ 
    (mkIf (cfg_server.enable) { networking.networkmanager.enable = true; })

    (mkIf (cfg_thinkpad.enable) {
      networking.networkmanager = {
        enable = true;
        ethernet.macAddress = "random";
        wifi = {
          scanRandMacAddress = true;
          macAddress = "random"; # permanent, preserve, random, stable.
        };
      };
    })
  ];
}
