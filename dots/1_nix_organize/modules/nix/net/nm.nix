{ config, lib, pkgs, ... }:

with lib; # Use the functions from lib, such as mkIf

let

  cfg_server = config.server.networkmanager;
  cfg_thinkpad = config.thinkpad.networkmanager;

in {

  # Interface: defining the options that users can specify.
  options.server.networkmanager.enable = mkOption {
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
