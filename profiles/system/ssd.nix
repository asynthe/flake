{ config, lib, pkgs, ... }:
with lib;
let
    cfg = config.system;
in {
    options.system.ssd = mkOption {
        type = types.bool;
        default = false;
        description = "Enable drivers and optimizations for SSD-type drives.";
    };

    config = mkIf cfg.ssd {

        services.fstrim.enable = true;
        environment.systemPackages = builtins.attrValues {
            inherit (pkgs)
                fio
            ;
        };
    };
}
