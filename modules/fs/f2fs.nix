{ config, pkgs, ... }: {

  boot.supportedFilesystems = [ "f2fs" ];

  fileSystems = {
    "/" = {
      options = ["compress_algorithm=lz4"];
      fsType = "f2fs";
      };
    "/boot" = {
      #device = "/dev/sdc1";
      fsType = "vfat";
    };
  };

}
