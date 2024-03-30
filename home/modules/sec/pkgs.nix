{ config, pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)
	    #wireshark #wireshark-cli
	    tshark
	;
	inherit (pkgs.unixtools)
	    xxd
	;
    };
}
