{ config, pkgs, ... }: {

  zramSwap = {
    enable = true;
    #priority = ;
    #memoryMax = ;
    #algorithm = ;
    #swapDevices = ; # Recommended is 1.
    #memory Percent = ; # Defaults to 1/2 of your total RAM.
    #writebackDevice = ;
  };

}
