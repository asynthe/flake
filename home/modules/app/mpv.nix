{ config, pkgs, lib, ... }: {

    programs.zsh.shellAliases = lib.mkIf config.programs.zsh.enable {
        mpv = "mpv --profile=norm";
	    cl = "mpv --no-resume-playback https://iptv-org.github.io/iptv/countries/cl.m3u";
    };

    programs.mpv = {
        enable = true;
	    scripts = with pkgs.mpvScripts; [
	        mpris
	        #thumbnail
	        thumbfast
	        visualizer
	    ];
	    config = {
            
            # Accelerated Video Playback
            hwdec = "auto-safe";
            #vo = "gpu";
            #profile = "gpu-hq";
            gpu-context = "wayland";

	        volume-max = "100";
	        save-position-on-quit = true;
	        hls-bitrate = "max";
	        #osc = false;
	        #force-window = true;
	        fullscreen = "no";

	        #cache-default = 4000000;
	        screenshot-directory = "~/Downloads/mpv_screenshots/";
	        screenshot-template = "%F_$03n";
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
