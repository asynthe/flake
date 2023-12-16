{
  config,
  pkgs,
  ...
}: {
  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      weechat #weechat-unwrapped
      #irssi
      #gajim # XMPP client
      signal-desktop
      telegram-desktop
      armcord #webcord 
      #discord #gtkcord4
      #teams #teams-for-linux # Microsoft Teams
      ;
  };
}
