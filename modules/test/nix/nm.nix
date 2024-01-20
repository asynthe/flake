{ config, lib, pkgs, ... }:

with lib; # Use the functions from lib, such as mkIf

let

  cfg_server = config.networkconfig.server;
  cfg_thinkpad = config.networkconfig.thinkpad;

in {

  # Interface: defining the options that users can specify.
  options.networkconfig = {
    server = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable Network Manager.";
      };
    };
    thinkpad = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable Network Manager.";
      };
    };
  };

  # Implementation: the module itself.
  #config = mkIf cfg_thinkpad.enable { 
    #networking.networkmanager = {
      #enable = true;
      #ethernet.macAddress = "random";
      #wifi = {
        #scanRandMacAddress = true;
        #macAddress = "random"; # permanent, preserve, random, stable.
      #};
    #};
  #};
  config = mkMerge [ 
    (mkIf (cfg_server.enable) { networking.networkmanager.enable = true; })
    (mkIf (cfg_thinkpad.enable) {
      networking.networkmanager = {
        enable = true;
        ethernet.macAddress = "random";
        wifi = {
          scanRandMacAddress = true;
          macAddress = "random";
        };
      };
    })
  ];

}
