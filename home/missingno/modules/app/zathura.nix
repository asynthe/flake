{ config, ... }: {

    programs.zathura = {
        enable = true;
	extraConfig = ''
	    set guioption ""
	    #set recolor true
	    set selection-clipboard clipboard
	'';
    };
}
