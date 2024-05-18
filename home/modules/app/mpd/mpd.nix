{ config, ... }: {

    imports = [
        #./mpd-discord-rpc.nix
        #./mpdris2.nix
    ];

    # Note, run `systemctl --user start mpd.service`

    services.mpd = {
        user = "${config.home.username}";
        enable = true;
        musicDirectory = config.xdg.userDirs.music;
        network.startWhenNeeded = true;
        extraConfig = ''
          auto_update           "yes"
          volume_normalization  "yes"
          restore_paused        "yes"
          filesystem_charset    "UTF-8"

          audio_output {
            type                "pipewire"
            name                "PipeWire"
          }

          audio_output {
            type                "fifo"
            name                "Visualiser"
            path                "/tmp/mpd.fifo"
            format              "44100:16:2"
          }

          audio_output {
           type		              "httpd"
           name		              "lossless"
           encoder		          "flac"
           port		              "8000"
           max_clients	        "8"
           mixer_type	          "software"
           format		            "44100:16:2"
          }
        '';
    };

        #extraConfig = ''
          #db_file "~/.config/mpd/database"
          #log_file "~/.config/mpd/log"
          #auto_update "yes"

          # Pipewire
          #audio_output {
          #  type            "pipewire"
          #  name            "PipeWire Sound Server"
          #} '';
    #};

    #services.mpd = {
       #enable = true;
       #musicDirectory = "/home/ben/music";
       #musicDirectory = "/home/${user}/music";
       #network.startWhenNeeded = false; # Socket activation.
       #extraConfig = ''

         # REQUIRED
         #db_file "~/.config/mpd/database"
         #log_file "~/.config/mpd/log"
         
         # MAIN
         #playlist_directory "~/.config/mpd/playlists"
         # pid_file "~/.config/mpd/pid"
         # state_file "~/.config/mpd/state"
         # sticker_file "~/.config/mpd/sticker.sql"
         
         # OTHER
         #log_level	"notice"
         #auto_update	"yes"
         #auto_update_depth "3"
         #bind_to_address "127.0.0.1"
         #port "6600"
         
         # OUTPUT
         #audio_output {
         #	type		"pulse"
         #	name		"Pulse Output"
         #	mixer_control	"Master"
         #}
         #audio_output {
         	#type		"pipewire"
         	#name		"PipeWire Sound Server"
         #}
         
         # VISUALIZER
         # buffer_time "100000"
         #audio_output {
         #type            "fifo"
         #name            "my_fifo"
         #path            "/tmp/mpd.fifo"
         #format          "44100:16:2"
        #} '';
    #};
}
