{ config, pkgs, ... }: {

  programs.mosh = {
    enable = true;
    withUtempter = true; # Default true.
  };

}
