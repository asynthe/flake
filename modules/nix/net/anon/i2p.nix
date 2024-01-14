{ config, ... }: {

  #services.i2p = {
  #enable = true;
  #};

  services.i2pd = {
    enable = true;
    #bandwidth = "32"; # I2PD defaults to 32kbps.
  };
}
