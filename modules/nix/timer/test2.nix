{ config, pkgs, username, ... }: {

  # The service
  systemd.services."test-backup" = {
    serviceConfig.Type = "oneshot";
    path = with pkgs; [ bash ];
    script = ''
      bash /home/${username}/script/bash/backup/backup_notes.sh
    '';
  };

  # The Timer
  systemd.timers."test-backup" = {
    wantedBy = [ "timers.target" ];
    partOf = [ "test-backup.service" ];
    timerConfig = {
      OnCalendar = "*:0/1"; # Every 1 minute.
    };
  };

}
