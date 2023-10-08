{ config, pkgs, ... }: {

  hardware.cpu.intel = {
    updateMicrocode = true;
    #sgx.provision = {
      #enable = true;
      #mode = ;
      #user = ;
      #group = ;
      #enableDcapCompat = ;
    #};
  };

}
