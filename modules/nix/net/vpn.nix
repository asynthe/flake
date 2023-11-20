{ config, pkgs, ... }: {

  # pkgs.mullvad only provides the CLI tool.
  # pkgs.mullvad-vpn provices both CLI and GUI.

  #services.mullvad-vpn = {
    #enable = true;
    #enableExcludeWrapper = true;
    #package = [ pkgs.mullvad-vpn ];
  #};

  programs.openvpn3.enable = true;
  #services.openvpn = {
    #servers = {
      #<name> = {
        #autoStart = ; # Default `true`.
	#updateResolvConf = ; # Default `false`.
	#restartAfterSleep = ; # Default `true`.
	#config = "config /path/to/config.ovpn" # or
	#config = "... \n"
	#authUserPass = {
	  #username = ; # Default `null`, using this option will put the credentials WORLD-READABLE in the Nix store!
	  #password = "";	  
        #};
      #};
    #};
  #};

  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)
      mullvad-vpn
      #openvpn
      #openvpn3
      ;
}
