{ config, pkgs, ... }:

{

  # Console / TTY configuration
  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
    packages = with pkgs; [ terminus_font ];
    keyMap = "us"; # or us/dvous/dvorak/etc
    #useXkbConfig = true; # use xkbOptions in tty.
  };

  # GPM - Mouse on TTY
  services.gpm = {
    enable = true;
    protocol = "ps/2";
  };

}
