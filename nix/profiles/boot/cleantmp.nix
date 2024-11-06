{ config, lib, ... }:
with lib; with types;
let
    cfg = config.meta.boot;
in {
    options.meta.boot.cleantmp = mkOption {
        type = bool;
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
