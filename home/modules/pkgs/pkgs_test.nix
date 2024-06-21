{ pkgs, ... }: {
    home.packages = builtins.attrValues {
        inherit (pkgs)
            linthesia
	        #ciscoPacketTracer8
	        #gns3-gui gns3-server
	        #slides
	        #zoom-us
	        #slack #slack-cli #slack-term # ?
        ;
    };
}
