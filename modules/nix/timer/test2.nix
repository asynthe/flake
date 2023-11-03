{ config, pkgs, ... }: {

  # The service
  systemd.services."test-dir" = {
    serviceConfig.Type = "oneshot";
    script = ''
      mkdir /home/asynthe/bin/test/sdtest
    '';
  };

  # The Timer
  systemd.timers."test-dir" = {
    wantedBy = [ "timers.target" ];
    partOf = [ "test-dir.service" ];
    timerConfig = {
      OnCalendar = "*:0/1"; # Every 1 minute.
    };
  };

}
