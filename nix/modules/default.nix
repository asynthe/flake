{ config, ... }: {

  imports = [

    #./irc.nix # IRC Client (WeeChat) # Just home manager?
    ./irc.server # IRC Server (Inspircd)

  ];
}
