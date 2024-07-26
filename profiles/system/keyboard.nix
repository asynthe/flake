{ config, lib, pkgs, ... }: 
with lib; with types;
let
    cfg = config.meta.system;
in {
    options.meta.system.keyboard = mkOption {
        type = bool;
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
