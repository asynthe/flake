{ config, pkgs, ... }: {

    programs.lf = {
        enable = true;
	#cmdKeybindings = ;
	#commands = ;
	#settings = ;
	#extraConfig = ;
    };

    #programs.zsh = {
        #initExtra = config.programs.zsh.initExtra // {
	    #.
	#};

    programs.zsh.shellAliases = {
	    lf = "lfcd";
	#};
    };
}
