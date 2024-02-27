{ config, pkgs, ... }: {

    virtualisation.vmware = {
        host = {
	    enable = true;
	    #package = ;
	    #extraPackages = with pkgs; [ ntfs3g ];
	    #extraConfig = ;
	};
	#guest = {
	    #enable = true;
	    #headless = true;
	#};
    };

    # `vmware-vmx` will cause kcompactd0 due to `Transparent Hugepages` feature in kernel.
    # Apply the next to disable it.
    #boot.kernelParams = [ "transparent_hugepage=never" ];
}
