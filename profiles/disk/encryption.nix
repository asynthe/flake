{ config, lib, ... }:
with lib; with types;
let
    cfg = config.meta.disk.encryption;
in {
    options.meta.disk.encryption = {
        enable = mkEnableOption "Enable LUKS encryption.";

        #device_name = {
            #type = nullOr str;
            #default = null;
            #description = "Name of the /dev/mapper device.";
        #};

        message = {
            type = str;
            default = "cat";
            description = "Enable a message when using LUKS encryption.";
        };
    };

    imports = [
        #../banner/luks/cat.nix
        ../banner/luks/dice.nix
    ];

    #config = mkIf cfg.enable {

        #assertions = [
            #{
                #assertion = cfg.device_name != null;
                #message = "Please specify a device for meta.disk.encryption.device_name.";
            #}
        #];

        # MESSAGE CONFIGURATION, NOT SETUP YET
        #boot.initrd.luks.devices.${cfg.device_name}.preLVM = mkIf (cfg.message != null) true;
        #boot.initrd.luks.devices.encrypted.preLVM = true;
    #};
}
