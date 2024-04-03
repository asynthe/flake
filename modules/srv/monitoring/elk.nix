{ config, pkgs, ... }: {

    services = {
        elasticsearch = {
            enable = true;
            #dataDir = ;
            #package = ;
            #port = ;
            #tcp_port = ;
            #logging = ;
            #listenAddress = ;
            #plugins = ;
            #cluster_name = ;
            #extraCmdLineOptions = ;
            #extraConf = ;
            #cert = ;
            #ca = ;
            #url = ;
            #certificateAuthorities = ;
	};

        #kibana = {
            #enable = ;
            #dataDir = ;
            #package = ;
            #port = ;
            #index = ;
            #listenAddress = ;
            #defaultAppdId = ;
            #cert = ;
            #extraConf = ;
            #key = ;
        #};
    };
}
