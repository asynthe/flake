{ config, pkgs, lib, ... }:
with lib;
let
    cfg = config.boot.console;
in {
    options.boot.console.enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Enable and set up a custom console configuration.
        '';
    };

    config = mkIf cfg.enable {
        console = {
            earlySetup = true;
            font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
            packages = with pkgs; [ terminus_font ];
            keyMap = "us";
        };
    };
}
