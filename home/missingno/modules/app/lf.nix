{ config, pkgs, ... }: {

    programs.lf = {
        enable = true;
	#cmdKeybindings = ;
	#commands = ;
	#settings = ;
	#extraConfig = ;
    };

<<<<<<< HEAD
    programs.zsh = {
        initExtra = ''
	  lfcd () {
            cd "$(command lf -print-last-dir "$@")"
          }
	'';
=======
    # lf -> lfcd
    programs.zsh = {
        initExtra = ''
	  lfcd () {
	    # `command` is needed in case `lfcd` is aliased to `lf`
	    cd "$(command lf -print-last-dir "$@")"
	  } '';
>>>>>>> f69fbd7fd7ca7b1a65e11e9d3f4ee8830eba9568
	shellAliases = {
	    lf = "lfcd";
	};
    };
}
