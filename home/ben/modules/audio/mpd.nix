{ config, username, pkgs, ... }: {

  services.mpd = {
    enable = true;
    musicDirectory = "/home/ben/music";
    extraConfig = ''
      db_file "~/.config/mpd/database"
      log_file "~/.config/mpd/log"
      auto_update "yes"

      # Pipewire
      audio_output {
        type            "pipewire"
        name            "PipeWire Sound Server"
      }
    '';
  };

  # THIS DOESNT WORK ON HOME MANAGER
  #systemd.services.mpd.environment = {
    #XDG_RUNTIME_DIR = "/run/user/1000";
  #};

  # OLD FROM DOWN HERE ! - DELETE

  #services.mpd = {
    #enable = true;
    #user = "${username}";
    #musicDirectory = "/home/${username}/music";
    #extraConfig = ''
    #  audio_output {
    #  type "pipewire"
    #  name "Pipewire"
    #  }
    #'';
    #startWhenNeeded = true;
  #};

  #services.mpd = {
    #enable = true;
    #musicDirectory = "/home/ben/music";
    #musicDirectory = "/home/${username}/music";
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
      #}
     #'';
  #};
}
