{
    programs.ncmpcpp.bindings = [

        # Vi Keys
        #{ key = "h"; command = [ "previous_column" "jump_to_parent_directory" ]; } # not working
        { key = "h"; command = "jump_to_parent_directory"; }
        { key = "j"; command = "scroll_down"; }
        { key = "k"; command = "scroll_up"; }
        #{ key = "l"; command = [ "next_column" "enter_directory" "play_item" ]; } # not working
        { key = "l"; command = "enter_directory"; }
        { key = "G"; command = "move_end"; }
        { key = "g"; command = "move_home"; }

        # Move item on cursor selection up or down
        { key = "J"; command = "move_selected_items_down"; }
        { key = "K"; command = "move_selected_items_up"; }

        # Seek
        { key = "H"; command = "seek_backward"; }
        { key = "L"; command = "seek_forward"; }

        # Arrow Keys
        { key = "left"; command = [ "previous_column" "jump_to_parent_directory" ]; }
        { key = "down"; command = "scroll_down"; }
        { key = "up"; command = "scroll_up"; }
        { key = "right"; command = "enter_directory"; }

        # Main keys
        { key = "<"; command = "previous"; }
        { key = ">"; command = "next"; }
        { key = "="; command = "volume_up"; } # I don't want to see the clock lol.
        { key = "I"; command = "show_server_info"; }
        { key = "R"; command = "add_random_items"; }
        { key = "b"; command = "toggle_bitrate_visibility"; }
        { key = "d"; command = [ "delete_playlist_items" "delete_browser_items" "delete_stored_playlist" ]; }
        { key = "p"; command = "pause"; }
        { key = "q"; command = "quit"; }
        { key = "tab"; command = "next_screen"; }
        { key = "u"; command = "update_database"; }

        # Views
        { key = "1"; command = "show_playlist"; }
        { key = "2"; command = "show_browser"; }
        { key = "3"; command = "show_clock"; }
        { key = "4"; command = "show_help"; }
        { key = "5"; command = "show_playlist_editor"; }
#  show_playlist_editor
    ];
}
