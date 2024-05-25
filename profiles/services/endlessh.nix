{ config, ... }: {

    services = {
        #endlessh-go = {
	    #enable = true;
	    #extraOptions = [ "-conn_type=tcp4" "-max_clients=8192" ];
	    #openFirewall = true;
	    #port = 22; # default `2222`.
	    #prometheus.listenAddress = ; # default `0.0.0.0`.
	    #prometheus.port = ; # default `2112`.
        #};
        endlessh = {
            enable = true;
	    #extraOptions = [ "-6" "-d 9000" "-v" ];
	    #openFirewall = true; # default `false`.
	    #port = 22; # default `2222`.
	};
    };
}
