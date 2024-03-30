{ config, pkgs, lib, username, ... }: 

let

    script = pkgs.writeShellApplication {
        name = "backup-librewolf-bookmarks-script";
	runtimeInputs = with pkgs; [ rsync ];
	text = ''
	  rsync -a --delete \
	  /home/${username}/.librewolf/sbm2zibt.default/bookmarkbackups/ \
	  /home/${username}/sync/study/backup/bookmarks
	'';
    };

in {

    systemd.user = {
        services.backup-librewolf-bookmarks = {
	    Unit.Description = "Copies the bookmarks folder from original folder into another";
	    Service = {
                Type = "oneshot";
		Restart = "on-failure";
		RestartSec = "2m";
                ExecStart = "${script}/bin/backup-librewolf-bookmarks-script";
            };
	};
        timers.backup-librewolf-bookmarks = {
	    Unit.Description = "Timer for bookmarks backup service";
            Install.WantedBy = [ "timers.target" ];
            Timer.OnCalendar = "*:0/10"; # Every 10 minutes.
        };
    };
}
