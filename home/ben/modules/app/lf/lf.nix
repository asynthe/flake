{ config, pkgs, ... }: 

let

    lf_scripts = import ./lf_scripts.nix;

in {

    #xdg.configFile."lf/icons".source = ./lf_icons;
    
    programs.lf = {
        enable = true;
	#settings = {
	    #icons = true;
	    #ignorecase = true;
	    #preview = true;

	    #tabstop = 4;
	    #hidden = true;
	    #number = true;
	    #ratios = [ 1 1 2 ];
	#};

	#commands = {
	    #editor-open = ''$$EDITOR $f'';
	    #mkdir = ''
	        #''${{
		    #printf "Directory Name: "
		    #read DIR
		    #mkdir $DIR
	        #}}
	    #'';
	#};

	#keybindings = {
	    # Opening files
	    #"<enter>" = "open";
	    # map <enter> shell # ?
	    # map <enter> open # ?
	    # map o &mimeopen $f
	    # map O $mimeopen --ask $f
	    # map ` !true
	    # map x $$f
	    # map X !$f
	    # Other
	    #"." = "set hidden!";
	    #"<c-h>" = "set hidden!";
	    #"<c-x>" = "cut";
	    #"<c-v>" = "paste";
	    #V = ''''$${pkgs.bat}/bin/bat --paging=always --theme=gruvbox "$f"'';
	    #zp = "toggle_preview";
	    #z1 = "set nopreview; set ratios 1";
	    #z2 = "set nopreview; set ratios 1:2";
	    #z3 = "set ratios 1:2; set preview";
	    #z4 = "set ratios 1:2:3; set preview";
	    # Archive
	    #az = "zip";
	    #ax = "extract";
	    #D = "trash";
	    #U = "!du -sh";
	    #gg = null;
	    #gh = "cd ~";
	#};
    };

    # REMOVE
    #home.packages = builtins.attrValues {
        #inherit (pkgs)
	    #bat fd ripgrep
	    #ueberzugpp
	#;
    #};
}
