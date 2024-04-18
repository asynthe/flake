{ config, pkgs, ... }: {

    #home.packages = builtins.attrValues {
        #inherit (pkgs)
	    #pinentry
	    #pinentry-curses
	#;
    #};

    programs.gpg = {
        enable = true;
	#homedir = "${}" # SECRET
    };

    services.gpg-agent = {
        enable = true;
	enableSshSupport = true;
	pinentryPackage = pkgs.pinentry-curses;
    };
}
