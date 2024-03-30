{ config, ... }: {

    #server.secrets.enable = true;

    imports = [
        ../../secrets/secrets.nix
	#../../secrets/secrets_custom.nix

	../../modules/nix/srv/boot.nix
	../../modules/nix/srv/fs.nix
	#../../modules/nix/srv/locate.nix
	../../modules/nix/srv/network.nix
        ../../modules/nix/srv/pkgs.nix
	../../modules/nix/srv/settings.nix
	../../modules/nix/srv/user.nix
	#../../modules/nix/srv/xmr.nix

	# systemd services + timers
	#../../modules/nix/srv/systemd/automount_hdd.nix
	#../../modules/nix/srv/systemd/backup_and_compress.nix
	#../../modules/nix/srv/systemd/qbittorrent.nix
    ];
}
