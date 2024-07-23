{ config, pkgs, ... }: {

    environment.binsh = "${pkgs.dash}/bin/dash"; # Change sh for dash.
    programs.lf.enable = true;
    programs.bash = {
        init.extra = ''
          lfcd () {
          cd "$(command lf -print-last-dir "$@")"
          }
        '';
        shellAliases = {
            lf = "lfcd";
            rm = "rm -i";
        };
    };
}
