{ config, lib, ... }:
with lib;
let
    cfg = config.framework.boot;
in {
    options.framework.boot.cleantmp = mkOption {
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
