{ config, pkgs, ... }: {

    programs.lf = {
        enable = true;
	#cmdKeybindings = ;
	#commands = ;
	#settings = ;
	#extraConfig = ;
    };

    # lf -> lfcd
    programs.zsh = {
        initExtra = ''
	  lfcd () {
	    # `command` is needed in case `lfcd` is aliased to `lf`
	    cd "$(command lf -print-last-dir "$@")"
	  } '';
	shellAliases = {
	    lf = "lfcd";
	};
    };
}
