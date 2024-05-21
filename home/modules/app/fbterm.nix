{ pkgs, user, ... }: {

    #users.users.${user}.extraGroups = [ "video" ]; # Not a Home Manager option.
    home = {
        packages = builtins.attrValues {
            inherit (pkgs)
                fbterm
                fbcat
            ;
        };
        file.".config/fbtermrc".text = ''
          font-names=JetBrainsMono Nerd Font
          font-size=26
          history-lines=65535
          cursor-shape=1
          cursor-interval=500
        '';
    };
}
