{ config, pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)

	    # Scanning
	    rustscan
	    nmap

	    # Networking
	    wireshark #wireshark-cli
	    #tshark
	    macchanger
	;
	inherit (pkgs.unixtools)
	    xxd
	;
    };
}
