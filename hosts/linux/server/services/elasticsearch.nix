{ config, pkgs, ... }: {

  services.elasticsearch = {
    enable = true;
    #dataDir = ""
    #extraConf = ""
    #logging = ""
  };

}
