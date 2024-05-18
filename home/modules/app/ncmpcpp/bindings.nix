{
    programs.ncmpcpp.bindings = [

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
        #{ key = "return"; command = "pause"; }
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
}
