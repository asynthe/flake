{
  config,
  pkgs,
  ...
}: {
  #systemd.user.services = {
  #  kopia = {
  #    Unit = {
  #      Description = "Kopia backup";
  #      After = [ "network.target" ];
  #    };
  #    Service = {
  #      Type = "oneshot";
  #      ExecStart = "/home/nairou/scripts/kopia.sh";
  #    };
  #    Install.WantedBy = [ "default.target" ];
  #  };
  #};

  #systemd.user.timers = {
  #  kopia = {
  #    Unit.Description = "Kopia backup schedule";
  #    Timer = {
  #      Unit = "kopia";
  #      OnCalendar = "06:00";
  #    };
  #    Install.WantedBy = [ "timers.target" ];
  #  };
  #};

  #systemd.user.services.kopia = {
  #  <...>
  #  Service = {
  #    <...>
  #    ExecStart = toString (
  #      pkgs.writeShellScript "kopia-start-script.sh" ''
  #        set -eou pipefail

  #        ${pkgs.kopia}/bin/kopia <...>
  #      ''
  #    );
  #  };
  #};

  ##### USER #####

  # SERVICES
  # systemd.user = {
  #   services = {
  #     "wallpaper-change" = {
  #       enable = true;
  #       wantedBy = ["default.target"];
  #       serviceConfig = {
  #         Type = "oneshot";
  #         User = "asynthe";
  #         };
  #       path = with pkgs; [ "fd" "swww" "pywal" ];
  #       script = "exec /home/asynthe/sync/system/script/dots/swww_random.sh";
  #       };
  #     };
  #
  # # TIMERS
  #   timers = {
  #     "wallpaper-change" = {
  #       wantedBy = [ "timers.target" ];
  #       timerConfig = {
  #         OnBootSec = "30s";
  #         OnUnitActiveSec = "30s";
  #         Unit = "swww-wallpaper.service";
  #       };
  #     };
  #   };
  # };
}
