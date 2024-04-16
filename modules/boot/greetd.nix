{ config, pkgs, user, ... }: {
    services.greetd = {
        enable = true;
	settings = {
	    default_session = {
	        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --greeting 'おはようございます！' --cmd Hyprland";
		user = "${user}"
	    };
	};
    };
}
