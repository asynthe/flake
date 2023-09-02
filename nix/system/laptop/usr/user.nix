{
  config,
  pkgs,
  username,
  ...
}: {
  # USER
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = ["docker" "wheel" "video" "audio" "networkmanager" "lp" "scanner"];
    shell = pkgs.zsh;
    initialPassword = "password";
    #openssh.authorizedKeys.keys = [
    #""
    #];
    #packages = with pkgs; [
    #];
  };

  # Dbus
  services.dbus.enable = true;

  # Replace sudo with doas
  security.sudo.enable = false;
  security.doas = {
    enable = true;
    extraRules = [
      {
        users = ["${username}"];
        keepEnv = true;
        #persist = true; # no auth every 5 mins.
        noPass = true;
      }
    ];
  };

  # PAM service
  security.pam.services = {
    gtklock = {};
    ${username}.gnupg = {
      enable = true;
      #storeOnly = ;
      #noAutostart = ;
    };
  };

  # Console / TTY configuration
  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
    packages = with pkgs; [terminus_font];
    keyMap = "us"; # or us/dvous/dvorak/etc
    #useXkbConfig = true; # use xkbOptions in tty.
  };

  # GPM - Mouse on TTY
  services.gpm = {
    enable = true;
    protocol = "ps/2";
  };
}
