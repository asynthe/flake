{ config, pkgs, ... }: {

    services.postfix = {
        enable = true;
	enableSmtp = true;
    };
}
