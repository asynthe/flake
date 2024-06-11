{ config, user, ... }: {

    # Better performance on games. Use with `gamemoderun`.
    users.users.${user}.extraGroups = [ "gamemode" ];
    programs.gamemode = {
        enable = true;
	enableRenice = true;
	#settings = ;
    };
}
