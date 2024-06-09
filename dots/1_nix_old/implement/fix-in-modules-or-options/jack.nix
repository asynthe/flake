{ config, pkgs, ... }: {

  #services.jack = {
  #jackd.enable = true;
  #alsa.enable = false;
  #loopback = {
  #enable = true;
  #dmixConfig = ''
  #  period_size 2048
  #'';
  #};
  #};

  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)
      qjackctl
      #cadence
      ;
  };

}
