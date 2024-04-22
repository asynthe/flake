{ config, pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)
            # Discord, fuck discord.
            webcord
            #armcord
            #gtkcord4
            #discord 

            #gajim # XMPP client
            signal-desktop
            telegram-desktop

            # IRC
            weechat
            #irssi
        ;
    };
}
