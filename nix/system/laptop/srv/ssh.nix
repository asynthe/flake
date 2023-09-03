{config, ...}: {
  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    startWhenNeeded = true; # sshd will be socket-activated, it will start for each incoming connection.
    allowSFTP = true; # enable the STFP subsystem, use commands sftp and sshfs.
  };

  #users.users.${username}.openssh.authorizedKeys.keys = [
    #""
    #];
}
