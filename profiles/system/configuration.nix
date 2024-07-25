{ config, lib, ... }:
with lib;
let
    cfg = config.system.configuration;
in {
    options.system.configuration = mkOption {
        type = types.str;
        default = "server";
        description = "Set up the system configuration.";
    };

    config = mkMerge [
        (mkIf (cfg == "laptop") {
            hardware.graphics.enable = true; # I'll probably use a wm of some kind.
        })
        (mkIf (cfg == "server") {
            hardware.graphics.enable = false;
        })
    ];
}
