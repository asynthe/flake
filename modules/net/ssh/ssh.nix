{ config, pkgs, ... }: {

    services.openssh = {
        enable = true;
        allowSFTP = true; # enable the STFP subsystem, use commands sftp and sshfs.
        #startWhenNeeded = true; # sshd will be socket-activated, it will start for each incoming connection.
    };
}
