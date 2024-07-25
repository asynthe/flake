{ config, lib, pkgs, ... }: 
with lib;
let
    cfg = config.framework.system;
in {
    options.framework.system.keyboard = mkOption {
        type = types.bool;
        default = false;
        description = "Enable QMK firmware for keyboards.";
    };

    config = mkIf cfg.keyboard {
        hardware.keyboard.qmk.enable = true;
        environment.systemPackages = builtins.attrValues {
            inherit (pkgs)
                qmk
            ;
        };
    };
}
