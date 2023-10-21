{ config, pkgs, ... }: {

  # Console / TTY configuration
  console = {
    earlysetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
    packages = with pkgs; [terminus_font];
    #keyMap = "us"; remove (?)
    #useXkbOptions = true; # use xkbOptions in tty.

  # GPM - Mouse on TTY
  services.gpm = {
    enable = true;
    protocol = "ps/2";
  };

}
