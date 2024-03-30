{ config, pkgs, username, ... }: {

    users.users.${username}.extraGroups = [ "fuse" ]; # Add to FUSE group and enable allow_other.
    programs.fuse.userAllowOther = true;
    services.openssh.allowSFTP = true; # Allow SFTP, which is used by SSHFS.

    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
	    sshfs
	    ;
    };
}
