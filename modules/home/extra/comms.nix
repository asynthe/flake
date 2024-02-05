{ config, pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      #gajim # XMPP client
      signal-desktop
      telegram-desktop

      # IRC
      weechat #weechat-unwrapped
      #irssi

      # Discord, fuck discord.
      #webcord
      #armcord
      #gtkcord4
      #discord 
      ;
  };
}
