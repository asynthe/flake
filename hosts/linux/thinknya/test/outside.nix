{ config, pkgs, ... }: {

  # Allow SFTP, which is used by SSHFS.
  services.openssh.allowSFTP = true;

}
