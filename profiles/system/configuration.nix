{ config, lib, pkgs, ... }:
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

        # This option is not yet added to Stable (24.05)
        # That is why is going to be commented out.
        hardware.graphics.enable = mkIf (cfg.type == "laptop") true;

        # Change sh for dash.
        environment.binsh = "${pkgs.dash}/bin/dash";

        # lf and some default safety measures.
        environment.systemPackages = builtins.attrValues {
            inherit (pkgs)
                lf
            ;
        };

        programs.bash = mkIf (cfg.type == "server") {
            shellInit = ''
              lfcd () {
              cd "$(command lf -print-last-dir "$@")"
              }
            '';
            shellAliases = {
                lf = "lfcd";
                rm = "rm -i";
            };
        };
    };
}
