{ pkgs, ... }: {

  programs.ncmpcpp = {
    enable = true;
    settings = {

      # MAIN
      ncmpcpp_directory = ''"~/.config/ncmpcpp"'';
      lyrics_directory = ''"~/.local/share/lyrics"'';
      
      # MPD
      mpd_music_dir = ''"~/music"'';
      mpd_host = ''"localhost"'';
      mpd_port = ''"6600"'';
      mpd_crossfade_time = ''"6"'';
      
      # VISUALIZER
      visualizer_data_source = ''"/tmp/mpd.fifo"'';
      visualizer_output_name = ''"my_fifo"'';
      visualizer_in_stereo = ''"yes"'';
      #visualizer_type = "spectrum"; (spectrum/wave)
      #visualizer_fps = "60";
      visualizer_look = ''"+|"'';
      
      # OTHER
      user_interface = ''"classic"'';
      header_visibility = ''"no"'';
      titles_visibility = ''"no"'';
      statusbar_visibility = ''"yes"'';
      display_bitrate = ''"no"'';
      
      # DISPLAY MODES
      playlist_editor_display_mode = ''"columns"'';
      search_engine_display_mode = ''"columns"'';
      browser_display_mode = ''"columns"'';
      playlist_display_mode = ''"classic"'';
      
      # COLORS
      colors_enabled = ''"yes"'';
      main_window_color = ''"white"'';
      # header_window_color = "";
      # volume_color = "";
      # statusbar_color = "";
      progressbar_color = ''"black"'';
      progressbar_elapsed_color = ''"white"'';
      
      # SONG LIST
      #song_list_format = ''"$6%a - $6%t $R$5%l "'';
      song_columns_list_format = ''“(20)[5]{a} (25)[5]{b} (5)[5]{y} (25)[6]{tr} (3f)[4]{n} (6f)[5]{lr}”'';
      
      # PROGRESS BAR
      progressbar_look = ''"─╼"'';
      
      # NOW PLAYING
      now_playing_prefix = ''"> "''; # Can also do "\"> \""
      centered_cursor = ''"yes"'';
    };

    bindings = [

      # Vi Keys
      #{ key = "h"; command = [ "previous_column" "jump_to_parent_directory" ]; }
      { key = "h"; command = "jump_to_parent_directory"; }
      { key = "j"; command = "scroll_down"; }
      { key = "k"; command = "scroll_up"; }
      { key = "l"; command = [ "next_column" "enter_directory" "play_item" ]; }
      { key = "g"; command = "page_up"; }
      { key = "G"; command = "page_down"; }

      { key = "<"; command = "seek_backward"; }
      { key = ">"; command = "seek_forward"; }

      # Arrow Keys
      { key = "left"; command = [ "previous_column" "jump_to_parent_directory" ]; }
      { key = "down"; command = "scroll_down"; }
      { key = "up"; command = "scroll_up"; }
      { key = "right"; command = [ "next_column" "enter_directory" "play_item" ]; }

      # Main keys
      { key = "return"; command = "pause"; }
      { key = "q"; command = "quit"; }
      { key = "p"; command = "pause"; }
      { key = "tab"; command = "next_screen"; }
      { key = "mouse"; command = "dummy"; }
      { key = "u"; command = "update_database"; }
      { key = "b"; command = "toggle_bitrate_visibility"; }

      # Views
      { key = "1"; command = "show_playlist"; }
      { key = "2"; command = "show_browser"; }
      { key = "3"; command = "show_clock"; }
      { key = "4"; command = "show_help"; }
    ];
  };
}
