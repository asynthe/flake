{ config, pkgs, username, ... }: {

  # The service
  systemd.user.services."backup-notes" = {
    serviceConfig.Type = "oneshot";
    wantedBy = [ "default.target" ]; # Test with this line.
    path = with pkgs; [ bash rsync ];
    script = ''
      bash /home/${username}/script/bash/backup/backup_notes.sh
    '';
  };

  # The Timer
  systemd.user.timers."backup-notes" = {
    wantedBy = [ "timers.target" ];
    partOf = [ "test-backup.service" ];
    timerConfig = {
      OnCalendar = "*:0/1"; # Every 1 minute.
    };
  };

}
