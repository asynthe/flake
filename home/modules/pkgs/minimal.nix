{ pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)

            # CLI
	        bc
	        fd ripgrep
	        fzf skim
	        git
	        ncdu
            curl
            htop btop
            jq
            killall
            lsof
            #neovim # If enabled, disable the dots import version.
            nh # Nix helper
            rsync
            tree
            wget

	        ascii
            httpie
            usbutils

	    	# Filesystem tools
		    fio
		    hdparm
		    nvme-cli
        ;
    };
}
