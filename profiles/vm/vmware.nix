{ pkgs-stable, ... }: {
    /* 
    `vmware-vmx` will cause kcompactd0 due to `Transparent Hugepages` feature in kernel.
    Apply the next to disable it.
    boot.kernelParams = [ "transparent_hugepage=never" ];
    */

    #services.xserver.videoDrivers = [ "vmware" ];

    virtualisation.vmware = {
        host = {
            enable = true;
	        package = pkgs-stable.vmware-workstation;
            #extraPackages = with pkgs; [ ntfs3g ];
	        #extraConfig = ;
	    };
	    #guest = {
            #enable = true;
	        #headless = true;
	    #};
    };
}
