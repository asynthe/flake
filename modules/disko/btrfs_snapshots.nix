{ lib, ... }: {

    # Testing (hacking) snapshots for impermanence.

    boot.supportedFilesystems = [ "btrfs" ]; # Appears
    boot.resumeDevice = "/dev/disk/by-label/nixos";

    boot.initrd.luks.devices."cryptroot" = {
        preLVM = true;
        allowDiscards = true;
    };

    boot.initrd = {
        postDeviceCommands = lib.mkAfter ''
          mkdir /mnt
          mount -t btrfs /dev/mapper/cryptroot
          btrfs subvolume delete /mnt/root
          btrfs subvolume snapshot /mnt/root-blank /mnt/root
        '';
        preLVMCommands = ''
          echo '--- OWNERSHIP NOTICE ---'
          echo 'This device is property of Jakob Gale'
          echo 'If lost please contact jakobgale144@gmail.com'
          echo '--- OWNERSHIP NOTICE ---'
        '';
    };
}

    # TESTING - 30 DAY SNAPSHOT DELETE?
    # THIS LOOKS COOL
    #boot.initrd =
    #    let
    #        rootReset = ''
    #    mkdir /btrfs_tmp
    #    mount /dev/root_vg/root /btrfs_tmp
    #    if [[ -e /btrfs_tmp/root ]]; then
    #        mkdir -p /btrfs_tmp/old_roots
    #        timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%H:%M:%S")
    #        mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
    #    fi
    #
    #    delete_subvolume_recursively() {
    #        IFS=$'\n'
    #        for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
    #            delete_subvolume_recursively "/btrfs_tmp/$i"
    #        done
    #        btrfs subvolume delete "$1"
    #    }
    #
    #    for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
    #        delete_subvolume_recursively "$i"
    #    done
    #
    #    btrfs subvolume create /btrfs_tmp/root
    #    umount /btrfs_tmp
    #    '';
    #    in
    #        {
    #            systemd.enable = true;
    #            systemd.services = {
    #                root-reset = {
    #                    wantedBy = [ "initrd-root-device.target" ];
    #                    wants = [ "dev-root_vg-root.device" ];
    #                    after = [ "dev-root_vg-root.device" ];
    #                    before = [ "sysroot.mount" ];
    #                    serviceConfig.Type = "oneshot";
    #                    script = rootReset;
    #                };
    #            };
    #        availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];
    #        kernelModules = [ "dm-snapshot" ];
    #        luks.devices."cryptroot".device = "/dev/disk/by-uuid/e16e9123-b1bb-4480-8557-3bfcdd503a95";
    #        luks.devices."cryptroot".allowDiscards = true;
    #        postDeviceCommands = lib.mkAfter rootReset;
    #  };
