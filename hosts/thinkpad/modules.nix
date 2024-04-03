{ config, lib, ... }: {

    # new xz update
    services.openssh.enable = lib.mkForce false;
    # And changed to stable.

    imports = [

        ../../secrets/secrets.nix
	#../../secrets/secrets_custom.nix

        #../../modules/disko/btrfs_persist.nix
	../../modules/android.nix
        ../../modules/audio.nix
        ../../modules/boot.nix
	../../modules/bluetooth.nix
        ../../modules/hyprland.nix
        ../../modules/net.nix
        ../../modules/pkgs.nix
        ../../modules/settings.nix
        ../../modules/sys.nix
        ../../modules/user.nix
        ../../modules/vpn.nix

        ../../modules/game/steam.nix
        ../../modules/sys/fstrim.nix
        ../../modules/vm/libvirt.nix

        ../../modules/net/ssh/mosh.nix
        ../../modules/net/ssh/ssh.nix
        ../../modules/net/ssh/sshfs.nix

	../../modules/driver/acpi.nix
        ../../modules/net/vpn/mullvad.nix
        ../../modules/sysd/lid_switch.nix # Lid switch action for laptops.

	# Security
	../../modules/sec/clamav.nix
    ];
}
