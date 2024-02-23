{ config, pkgs, username, ... }: {

    users.users.ben.extraGroups = [ "fuse" ]; # Add to FUSE group and enable allow_other.
    #users.users.${username}.extraGroups = [ "fuse" ];
    programs.fuse.userAllowOther = true;
    services.openssh.allowSFTP = true; # Allow SFTP, which is used by SSHFS.

    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
	    sshfs
	    ;
    };
}
