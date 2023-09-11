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

      #elasticsearch = {
        #cert = ;
        #ca = ;
        #url = ;
	#certificateAuthorities = ;
      #};
    #};
  };
}
