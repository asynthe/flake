{ config, pkgs, ... }: {

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
