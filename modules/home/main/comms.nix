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
      webcord #discord #gtkcord4
      #teams-for-linux #teams # Microsoft Teams
      ;
  };
}
