{ config, ... }: {

  imports = [

    ./irc.nix # IRC Client (WeeChat)
    ./irc.server # IRC Server (Inspircd)

  ];
}
