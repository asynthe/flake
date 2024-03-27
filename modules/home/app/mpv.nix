{ config, pkgs, ... }: {

    programs.mpv = {
        enable = true;
	scripts = with pkgs.mpvScripts; [
	    mpris
	    thumbnail
	    thumbfast
	    visualizer
	];
	config = {
	    volume-max = "100";
	    hls-bitrate = "max";
	    #profile = "gpu-hq";
	    force-window = true;
	    cache-default = 4000000;
	    osc = "no";
	    save-position-on-quit = true;
	    screenshot-directory = "~/Downloads/screenshots/";
	    screenshot-template = "%F_$03n";
	    fullscreen = "no";
	    #"extension.flac" = "";
	    #"extension.mkv" = "";
	    #"extension.gif" = "";
	};
	profiles = {
	    norm = {
	        profile-desc = "Normalize audio volume";
		af = "lavfi=[loudnorm=I=-16:TP=-3:LRA=4]";
	    };
	};
	bindings = {
	    h = "seek -5";
	    j = "add volume -2";
	    k = "add volume 2";
	    l = "seek 5";
	};
    };
}
