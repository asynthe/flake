{ config, ... }: {

    # Windows mounting and dual-booting
    # More info in https://nixos.wiki/wiki/Dual_Booting_NixOS_and_Windows
    # Note: add a let variable to flake, windows_partition = "/dev/..."

    boot.loader.grub.useOSProber = true;
    fileSystems."/home/${username}/windows" = {
        device = "/dev/sda2";
        fsType = "ntfs";
    };
    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
	    ntfs3g
	;
    };

    # System clock may be incorrent when going back to NixOS
    # Make sure to set RTC time standard to UTC on Windows
    # Or setting it to localtime on NixOS
    #time.hardwareClockInLocalTime = true;
}
