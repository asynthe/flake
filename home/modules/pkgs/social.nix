{ pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)
            signal-desktop
            telegram-desktop
            weechat hexchat # irc
            webcord #discord # fuck discord
        ;
    };
}
