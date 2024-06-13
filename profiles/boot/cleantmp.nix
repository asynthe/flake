{ config, lib, ... }:
with lib;
let
    cfg = config.boot;
in {
    options.boot.cleantmp = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Clean /tmp on reboot.
        '';
    };
    
    config = mkIf cfg.cleantmp {

        boot.tmp = {
            cleanOnBoot = true;
            #useTmpfs = true;
            #tmpfsSize = "20%"; # default `"50%"`.
        };
    };
}
