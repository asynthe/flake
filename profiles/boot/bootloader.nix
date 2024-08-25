{ config, lib, ... }:
with lib; with types;
let
    cfg = config.meta.boot;
in {
    options.meta.boot = {
        bootloader = mkOption {
            type = str;
            default = "systemd-boot";
            description = "System boot loader.";
        };
        generations = mkOption {
            type = int;
            default = 3;
            description = "Number of generations to output.";
        };
    };
    config = mkMerge [

        # systemd-boot
        (mkIf (cfg.bootloader == "systemd-boot") { 
            boot.loader = {
                efi.canTouchEfiVariables = true;
                timeout = 5;
                systemd-boot.enable = true;
                systemd-boot.configurationLimit = cfg.generations;
            };
        })

        # Grub
        #(mkIf (cfg.bootloader == "grub") { 
            #boot.loader = {
                #...
            #};
        #})
    ];
}
