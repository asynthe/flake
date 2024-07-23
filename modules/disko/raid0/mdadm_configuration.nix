# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # RAID
  boot.initrd.services.swraid.mdadmConf = "\n
  ARRAY /dev/md0 level=raid0 num-devices=2 metadata=1.2 name=nixos:0 UUID=07344cc0:b27028eb:adb9b887:069814be\n
   devices=/dev/nvme0n1p1,/dev/nvme1n1p1\n
  ";
}

