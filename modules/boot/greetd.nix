{ pkgs, inputs, ... }: 
let

    tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
    hyprland-session = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/share/wayland-sessions";

in {
    services.greetd = {
        enable = true;
	    settings = {
	    default_session = {
	        command = "${tuigreet}/bin/tuigreet --time --remember --remember-session --greeting 'おはようございます！' --sessions ${hyprland-session}";
		    user = "greeter";
	        };
	    };
    };

    # Clean greetd of any tty output.
    # https://github.com/sjcobb2022/nixos-config/blob/main/hosts/common/optional/greetd.nix
    systemd.services.greetd.serviceConfig = {
        Type = "idle";
        StandardInput = "tty";
        StandardOutput = "tty";
        StandardError = "journal"; # Without this errors will spam on the screen.
        # Without these bootlogs will spam on screen
        TTYReset = true;
        TTYVHangup = true;
        TTYVTDisallocate = true;
    };
}
