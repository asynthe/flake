{ pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)

	        # CLI
            nh
	        ascii
	        bc
	        fd ripgrep
	        fzf skim
	        git
	        ncdu
            #neovim # If enabled, disable the dots import version.

	    	# Filesystem tools
		    fio
		    hdparm
		    nvme-cli
        ;
    };
}
