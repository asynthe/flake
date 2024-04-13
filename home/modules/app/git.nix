{ config, pkgs, username, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)
	    git
	    bfg-repo-cleaner
	;
    };

    #programs.git = {
        #enable = true;
	#userEmail = "person@email.com"; # SECRET
	#userName = "kali-wsl";
	#userName = "${username}"
	#extraConfig = ''
	    #git config --global core.sshCommand 'ssh -i <path/to/ssh> # SECRET
	#'';
    #};
}
