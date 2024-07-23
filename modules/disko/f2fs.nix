{ config, pkgs, ... }: {

    # WHAT DIS??? CREAT DISKO
    boot.supportedFilesystems = [ "f2fs" ];
    fileSystems = {
        "/" = {
            #device = "/dev/md0";
            options = [ "compress_algorithm=lz4" ];
            fsType = "f2fs";
        };
        "/boot" = {
            #device = "/dev/sda1";
            fsType = "vfat";
        };
  };
}
