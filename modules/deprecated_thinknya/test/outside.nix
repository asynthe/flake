{ config, pkgs, username, ... }: {

  # Allow SFTP, which is used by SSHFS.
  services.openssh.allowSFTP = true;

  # Add to FUSE group and enable allow_other.
  users.users.${username}.extraGroups = [ "fuse" ];
  programs.fuse.userAllowOther = true;

}
