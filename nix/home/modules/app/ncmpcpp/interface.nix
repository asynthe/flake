{
    programs.ncmpcpp.settings = {

        # Interface
        now_playing_prefix = ''"> "''; # Can also do "\"> \""
        centered_cursor = ''"yes"'';
        progressbar_look = ''"─╼"'';
        user_interface = ''"classic"'';
        header_visibility = ''"no"'';
        titles_visibility = ''"no"'';
        statusbar_visibility = ''"yes"'';
        display_bitrate = ''"no"'';

        # SONG LIST
        #song_list_format = ''"$6%a - $6%t $R$5%l "'';
        song_columns_list_format = ''“(20)[5]{a} (25)[5]{b} (5)[5]{y} (25)[6]{tr} (3f)[4]{n} (6f)[5]{lr}”'';
        
        # DISPLAY MODES
        playlist_editor_display_mode = ''"columns"'';
        search_engine_display_mode = ''"columns"'';
        browser_display_mode = ''"columns"'';
        playlist_display_mode = ''"classic"'';
        
        # COLORS
        colors_enabled = ''"yes"'';
        main_window_color = ''"white"'';
        progressbar_color = ''"black"'';
        progressbar_elapsed_color = ''"white"'';
        # header_window_color = "";
        # volume_color = "";
        # statusbar_color = "";

        # Visualizer
        #visualizer_data_source = ''"/tmp/mpd.fifo"'';
        #visualizer_output_name = ''"my_fifo"'';
        #visualizer_in_stereo = ''"yes"'';
        #visualizer_type = "spectrum"; (spectrum/wave)
        #visualizer_fps = "60";
        #visualizer_look = ''"+|"'';
    };
}
