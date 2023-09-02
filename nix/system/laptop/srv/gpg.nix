{config, ...}: {
  # GPG
  programs.gnupg = {
    #package = ...
    #dirmngr.enable = true;
    agent = {
      enable = true;
      pinentryFlavor = "curses";
      #enableSSHSupport = true;
      #enableExtraSocket = true;
      #enableBrowserSocket = true;
    };
  };

  #environment.systemPackages = with pkgs; [
  #];
}
