{ config, lib, ... }:
with lib; with types;
let
    cfg = config.meta.gaming;
in {
    options.meta.gaming.gamemode = mkOption {
        type = bool;
        default = false;
        description = "Enable Gamemode to get more performance in games.";
    };

    config = mkIf cfg.gamemode {

        # Better performance on games. Use with `gamemoderun`.
        users.users.${config.meta.system.user}.extraGroups = [ "gamemode" ];
        programs.gamemode = {
            enable = true;
	        enableRenice = true;
	        #settings = ;
        };
    };
}
