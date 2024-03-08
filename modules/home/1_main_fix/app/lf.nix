{ config, pkgs, ... }: {

    programs.lf = {
        enable = true;
	#settings = {
	    #number = true;
	    #ratios = [ 1 1 2 ];
	    #tabstop = 4;
	#};

	#keybindings = {
	    #D = "trash";
	    #U = "!du -sh";
	    #gg = null;
	    #gh = "cd ~";
	#}

	#extraConfig = ''
	    #mkdir -p ~/.trash
	#''

	#previewer = {
	    #keybinding = "i"
	    #source = pkgs.writeShellScript "pv.sh" ''
	        ##!/bin/sh case "$1" in *.tar*)
	    #};
	#};
    };
}
