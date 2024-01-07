{ config, pkgs, ... }: {

  services.fprintd = {
    enable = true;
    #package = "";

    # Touch OEM Drivers library support.
    #tod = {       
      #enable = true;
      #driver = "";
        # If the vfs0090 Driver does not work, use the following driver.
        #pkgs.libfprint-2-tod1-vfs0090;  

        # On my device it only worked with this driver.
        #pkgs.libfprint-2-tod1-goodix;     
      #};
  };

}
