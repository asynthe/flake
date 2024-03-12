{ config, pkgs, username, ... }: {

    programs.git = {
        enable = true;
	userEmail = "bendunstan@protonmail.com"; # SECRET
	userName = "alpine-wsl";
	#userName = "${username}"
	#extraConfig = '' 
	    #git config --global core.sshCommand 'ssh -i <path/to/ssh>
	#'';
    };
}
