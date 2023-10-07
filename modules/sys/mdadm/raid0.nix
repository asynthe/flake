{ 
  config, 
  pkgs, 
  ... 
}: let
  filePath = ./mdadm.conf;
  fileContent = builtins.readFile filePath;
in {

  boot.swraid.mdadmConf = "${fileContent}";

}
