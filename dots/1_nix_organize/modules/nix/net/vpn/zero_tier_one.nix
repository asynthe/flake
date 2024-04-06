{ config, ... }: {

  services.zerotierone = {
    enable = true;
    #port = ; from 0 to 65535, default 9993.
    #package = ;
  };

}
