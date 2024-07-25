{ config, lib, pkgs, ... }:
with lib;
let
    cfg = config.framework.boot;
in {
    options.framework.boot.console = mkOption {
        type = types.bool;
        default = false;
        description = "Enable and set up a custom console configuration.";
    };

    config = mkIf cfg.console {
        console = {
            earlySetup = true;
            font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
            packages = with pkgs; [ terminus_font ];
            keyMap = "us";
        };
    };
}
