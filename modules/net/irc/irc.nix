{config, ...}: {
  services.weechat = {
    enable = true;
    #root = "var/lib/weechat"; # Weechat state directory.
    #sessionName = "weechat-screen"; # Name of the `screen` session for Weechat.
    #binary = "${pkgs.weechat}/bin/weechat" # Binary to execute.
  };

  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)
      hexchat
      ;
  };
}
