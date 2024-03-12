{ config, pkgs, ... }: {

    programs.ssh = {
        enable = true;
	#extraConfig = "-i <path>"; # SECRET (path to SSH key)
    };
}
