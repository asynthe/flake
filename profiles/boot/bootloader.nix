{ config, lib, ... }:
with lib;
let
    cfg = config.boot;
in {
    options.boot.bootloader = mkOption {
        type = types.str;
        default = "systemd-boot";
        description = ''
          System boot loader.
        '';
    };

    options.boot.generations = mkOption {
        type = types.int;
        default = 3;
        description = ''
          Number of generations to output.
        '';
    };

    config = mkMerge [
        (mkIf (cfg.bootloader == "systemd-boot") { 
            boot.loader = {
                efi.canTouchEfiVariables = true;
                timeout = 5;
                systemd-boot.enable = true;
                systemd-boot.configurationLimit = cfg.generations;
            };
        })
        #(mkIf (cfg.bootloader == "grub") { 
            #boot.loader = {
                #...
            #};
        #})
    ];
}