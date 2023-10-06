{ 
  config, 
  pkgs, 
  ... 
}: let
  filePath = ./mdadm.conf;
  fileContent = builtins.readFile filePath;
in {

  boot.initrd.services.swraid.mdadmConf = "${fileContent}";

}
