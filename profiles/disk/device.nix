{ config, lib, ... }:
with lib; with types;
let
    cfg = config.meta.disk;
in {
    options.meta.disk.device = mkOption {
        type = nullOr str;
        default = null;
        description = "Specify device where to install NixOS.";
    };

    config.assertions = [
        {
            assertion = cfg.device != null;
            message = "You must specify a system device for disko.";
        }
    ];
}
