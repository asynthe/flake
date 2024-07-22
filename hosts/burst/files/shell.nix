{
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
