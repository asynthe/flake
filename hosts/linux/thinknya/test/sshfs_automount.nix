{ config, pkgs, lib, username, ... }: 

with lib;

let

  cfg = config.thinkpad.server.automount;

in {

  options.thinkpad.server.automount = {
    #enable = mkOption {
      #type = types.bool;
      #default = false;
      #description = "Automount server-pc.";
    #};

    fstab = mkOption {
      type = types.bool;
      default = false;
      #description = "";
    };

    systemd = mkOption {
      type = types.bool;
      default = false;
      #description = "";
    };

    #type = mkOption {
      #type = types.enum [ "service" "fstab" ];
      #default = "service";
      #description = "Choose fstab or a systemd service with timer."
    #};
  };

  config = mkMerge [

    (mkIf (cfg.systemd) {

      systemd.user.services."sshfs_automount" = {
        serviceConfig.Type = "oneshot";
	path = with pkgs; [ bash ];
	script = ''
	  bash /home/${username}/sync/dots/script/bash/timer/sshfs_automount.sh
	'';
      };

      systemd.user.timers."sshfs_automount" = {
        wantedBy = [ "timers.target" ];
	partOf = [ "ssfs_automount.service" ];
	timerConfig = {
	  #OnCalendar = "0/2:00:00";
	  OnCalendar = "00/2:00";
	};
      };

    })

    (mkIf (cfg.fstab) {
      #system.fsPackages = [ pkgs.sshfs ];
      #fileSystems.sshfs_server = {
        #device = "ben@100.122.54.91:~/";
        #mountPoint = "/mnt/server";
        #fsType = "sshfs";
        #options = [
          #"allow_other"
          #"_netdev"
          #"x-systemd.automount"

          # The ssh key must not be encrypted, have 
          # strict permissions (like 600) and be owned by root.
          #"IdentityFile=/home/asynthe/sync/ben/pass/ssh/thinknya"

          # Handle connection drops better
          #"ServerAliveInterval=15"
          #"reconnect"

          # You can specify some of the ssh_config(5)
          # options, for example:
          #"ProxyJump=bastion@example.com"
          #"Port=22"

          # You can also change the ssh command.
          # Note: in any option spaces must be
          # escaped because it goes to /etc/fstab,
          # a table of space-separated fields.
          #(builtins.replaceStrings [" "] ["\\040"]
          #  "ssh_command=${pkgs.openssh}/bin/ssh -v -L 8080:localhost:80")

          # Uncomment this if you're having a hard time
          # figuring why mounting is failing.
          #"debug"
        #];
      #};
    })
  ];

}
