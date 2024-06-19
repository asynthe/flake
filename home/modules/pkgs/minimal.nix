{ pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)

            #neovim # While nixvim doesn't work.

	        # CLI
            htop
            tree
            wget
            rsync
            killall
            nh
	        ascii
	        bc
	        fd ripgrep
	        fzf skim
	        git
	        ncdu
            #neovim # If enabled, disable the dots import version.
            httpie

	    	# Filesystem tools
		    fio
		    hdparm
		    nvme-cli
        ;
    };
}
