{ config, pkgs, username, ... }: {

  # The service
  systemd.user.services."test-backup" = {
    serviceConfig.Type = "oneshot";
    wantedBy = [ "default.target" ]; # Test with this line.
    path = with pkgs; [ bash rsync ];
    script = ''
      bash /home/${username}/script/bash/backup/backup_notes.sh
    '';
  };

  # The Timer
  systemd.user.timers."test-backup" = {
    wantedBy = [ "timers.target" ];
    partOf = [ "test-backup.service" ];
    timerConfig = {
      OnCalendar = "*:0/1"; # Every 1 minute.
    };
  };

}
