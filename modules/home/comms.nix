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
      discord
      webcord
      gtkcord4
      # Microsoft Teams
      
      teams-for-linux #teams
      
      ;
  };
}
