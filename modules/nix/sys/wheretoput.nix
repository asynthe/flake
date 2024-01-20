{ config, pkgs, username, ... }: {

  services = {
    dbus.enable = true; # D-bus

    # Mouse on the TTY
    gpm = {
      enable = true;
      protocol = "ps/2";
    };
  };

  # Console / TTY configuration
  #console = {
    #earlysetup = true;
    #font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
    #packages = with pkgs; [terminus_font];
    #keyMap = "us"; remove (?)
    #useXkbOptions = true; # use xkbOptions in tty.
  #};

  # PAM service
  #security.pam.services = {
    #gtklock = {};
    #${username}.gnupg = {
      #enable = true;
      #storeOnly = ;
      #noAutostart = ;
    #};
  #};

}
