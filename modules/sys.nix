{ pkgs, ... }: {

    # mkIf system.disk.ssd = true; then .
    # where the fuck did it go? fstrim = true
    #../../modules/sys/fstrim.nix 
    services.fstrim.enable = true;

    boot.binfmt.emulatedSystems = [ "aarch64-linux" "riscv64-linux" ];
    boot.supportedFilesystems = [ "ext4" "xfs" "vfat" ];
    environment.binsh = "${pkgs.dash}/bin/dash"; # Change sh for dash.
    environment.systemPackages = builtins.attrValues { inherit (pkgs) ntfs3g; };
    services.gvfs.enable = true; # Needed for almost all file explorers.
}
