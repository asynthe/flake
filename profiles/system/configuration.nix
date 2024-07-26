{ config, lib, ... }:
with lib; with types;
let
    cfg = config.meta.system;
in {
    options.meta.system = {
        user = mkOption { type = str; };
        type = mkOption {
            type = str;
            default = "server";
        };
        disk.device = mkOption { type = str; };
    };
    config = {
        # I'll probably use a wm of some kind.
        hardware.graphics.enable = mkIf (cfg.type == "laptop") true;
    };
}
