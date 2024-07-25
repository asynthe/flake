{ config, lib, ... }:
with lib; with types;
let
    cfg = config.framework.system;
in {
    options.framework.system = {
        user = mkOption { type = str; };
        disk = mkOption { type = str; };
        type = mkOption {
            type = str;
            default = "server";
        };
    };
    config = {

        # I'll probably use a wm of some kind.
        hardware.graphics.enable = mkIf (cfg.type == "laptop") true;
    };
}
