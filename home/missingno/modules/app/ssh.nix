{ config, pkgs, ... }: {

    programs.ssh = {
        enable = true;
	#extraConfig = "-i <path>"; # SECRET
    };
}
