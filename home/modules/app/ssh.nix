{ config, ... }: {

    programs.ssh = {
        enable = true;
	#extraConfig = "-i <path>"; # SECRET
    };
}
