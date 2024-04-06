{ config, pkgs, ... }: {

    #beats
    #elastic
    #kibana
    #logstash

    services = {
        elasticsearch = {
            enable = true;
            #ca = ;
            #cert = ;
            #certificateAuthorities = ;
            #cluster_name = ;
            #dataDir = ;
            #extraCmdLineOptions = ;
            #extraConf = ;
            #listenAddress = ;
            #logging = ;
            #package = ;
            #plugins = ;
            #port = ;
            #tcp_port = ;
            #url = ;
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

	logstash = {
	    enable = true;
	    #package = ;
	    #outputConfig = ;
	    #inputConfig = ;
	    #filterConfig = ;
	    #plugins = ;
	    #dataDir = ;
	    #port = ;
	};
    };
}
