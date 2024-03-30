{ config, pkgs, lib, username, ... }:

let
    wallpaper_dir = "/home/${username}/sync/archive/wallpaper/img/favourite";
    script = pkgs.writeShellApplication {
        name = "swww_randomize.sh";
	runtimeInputs = with pkgs; [ bash swww ];
	text = ''
          WALLPAPER_DIR="${wallpaper_dir}"

          # Check if exists
          if [[ ! -d $WALLPAPER_DIR ]]; then
              echo "Error: Wallpaper directory not found: $WALLPAPER_DIR"
              exit 1
          fi

	  # Configuration
          export SWWW_TRANSITION_FPS=60
          export SWWW_TRANSITION_STEP=2

          while true; do
              # Find all files in the specified directory
              find "$WALLPAPER_DIR" -type f \
                  | while read -r img; do
                      # Output a random number followed by the image path
                      echo "$((RANDOM % 1000)):$img"
                  done \
                  | sort -n | cut -d':' -f2- \
                  | while read -r img; do
                      # Set the current image as wallpaper
                      swww img "$img"
                  done
          done
        '';
    };

in {

    systemd.user = {
        services.swww-randomize = {
	    Unit.Description = "Changes the wallpaper";
	    Service = {
                Type = "oneshot";
		Restart = "on-failure";
		RestartSec = "2m";
                ExecStart = "${script}/bin/swww_randomize.sh";
            };
	};
        timers.swww-randomize = {
	    Unit.Description = "Timer for swww randomize script";
            Install.WantedBy = [ "timers.target" ];
            Timer.OnCalendar = "*:0/5"; # Every 5 minutes.
        };
    };
}
