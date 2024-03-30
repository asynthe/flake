{ config, username, ... }: {

    # Better performance on games. Use with `gamemoderun`.
    users.users.${username}.extraGroups = [ "gamemode" ];
    programs.gamemode = {
        enable = true;
	enableRenice = true;
	#settings = ;
    };
}
