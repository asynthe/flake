{ config, lib, ... }:
with lib;
let
    cfg = config.disk;
in {
    options.disk.ssd = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Enable drivers and optimizations for SSD-type drives.
        '';
    };

    config = mkIf cfg.ssd {

        # ADD SSD PACKAGES LIKE SMART, FIO(?)
        services.fstrim.enable = true;
    };
}
