{
  config,
  pkgs,
  ...
}: {
  # I2P
  #services.i2p = {
  #enable = true;
  #};

  # I2PD
  services.i2pd = {
    enable = true;
    #bandwidth = "32"; # I2PD defaults to 32kbps.
  };
}
