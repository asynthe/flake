{ config, pkgs, ... }: {

    services.barrier.client = {
        enable = true;
	enableDragDrop = true;
	enableCrypto = true;
	#extraFlags = ;
    };
}
