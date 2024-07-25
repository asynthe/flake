{ config, lib, pkgs, ... }:
with lib; with types;
let
    cfg = config.framework.system;
in {
    options.framework.system.ssd = mkOption {
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
