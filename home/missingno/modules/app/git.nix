{ config, pkgs, username, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)
	    git
	;
    };

    #programs.git = {
        #enable = true;
	#userEmail = "bendunstan@protonmail.com"; # SECRET
	#userName = "kali-wsl";
	#userName = "${username}"
	#extraConfig = '' # SECRET
	    #git config --global core.sshCommand 'ssh -i <path/to/ssh>
	#'';
    #};
}
