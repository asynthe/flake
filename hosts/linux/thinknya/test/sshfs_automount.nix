{ config, pkgs, ... }: {

  # Allow SFTP, which is used by SSHFS.
  services.openssh.allowSFTP = true;

  # Here is fstab.
  system.fsPackages = [ pkgs.sshfs ];
  fileSystems.sshfs_server = {
    device = "ben@100.122.54.91:~/";
    mountPoint = "/mnt/server";
    fsType = "sshfs";
    options = [
      "alow_other"
      "_netdev"
      "x-systemd.automount"

      # The ssh key must not be encrypted, have 
      # strict permissions (like 600) and be owned by root.
      "IdentityFile=/home/asynthe/sync/ben/pass/ssh/thinknya"

      # Handle connection drops better
      "ServerAliveInterval=15"
      "reconnect"

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
    ];
  };

}
