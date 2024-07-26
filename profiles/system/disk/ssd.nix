{ config, lib, pkgs, ... }:
with lib; with types;
let
    cfg = config.meta.system.disk;
in {
    options.meta.system.disk.ssd = mkOption {
        type = bool;
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
