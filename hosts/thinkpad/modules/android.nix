{ config, pkgs, username, ... }: {

    # Waydroid
    virtualisation.waydroid.enable = true;

    # adb
    programs.adb.enable = true;
    users.users.${username}.extraGroups = ["adbusers"];
    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
            scrcpy
	;
    };
}
