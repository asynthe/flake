{ pkgs, user, ... }: {

    # Waydroid
    virtualisation.waydroid.enable = true;

    # adb
    programs.adb.enable = true;
    users.users.${user}.extraGroups = [ "adbusers" ];
    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
            jmtpfs
            scrcpy
	    ;
    };
}
