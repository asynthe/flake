{ config, pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs) 
            tmux 
            tmuxp
        ; 
    };

    xdg.configFile = {
        "tmux/tmux.conf".source = config.lib.file.mkOutOfStoreSymlink ./tmux.conf;
    };

    #programs.tmux = {
        #enable = true;
	    #tmuxp.enable = true;

	    # Configuration
	    #prefix = "C-x";
	    #keyMode = "vi";
	    #baseIndex = 1; # Start from 1 instead of 0.
	    #historyLimit = 5000;
	    #mouse = true;
	    #terminal = "tmux-256color";
	    #shell = "${pkgs.zsh}/bin/zsh";
	#extraConfig = ''
	  #set -g set-clipboard on # Clipboard

	 ## Image Preview
	 #set -g allow-passthrough on
	 #set -ga update-environment TERM
	 #set -ga update-environment TERM_PROGRAM
     #
	 ## Status
	 #set -g status off # Start with status off.
	 #set-option -g status-position top
	 #set-option -g status-style fg=white,bg=default # Transparency.
	 ##set-option -g status-style fg=color20,bg=default # Transparency.
	 #bind t set -g status
     #
	 ## Status configuration # IN PROGRESS
	 ##set -g status-right "''${wg_funkyprefix}"
     #
	 ## Unbinds
	 #unbind q
	 #unbind s
     #
	 ## Keybinds
	 #bind space next-layout
	 #bind Tab choose-tree
	 ##bind Q kill-window # ?
	 #bind Q detach # ?
	 #bind e confirm kill-window \; switch-client -T prefix
	 #bind E confirm kill-server
	 #bind b break-pane
	 #bind N new-session # ?
     #
	 ##bind -n C-a clear-history
	 #bind -n C-a send-keys C-l
	 #bind -n C-z resize-pane -Z # Maximize pane
	 #bind -n C-n swap-pane -D \; switch-client -T prefix
     #
	 ### Split window
	 #bind n new-window -c "#{pane_current_path}"
	 #bind '|' split-window -v -c "#{pane_current_path}"
	 #bind '\' split-window -h -c "#{pane_current_path}"
     #
	 ### Change focused pane
	 #bind -n C-h select-pane -L
	 #bind -n C-j select-pane -D
	 #bind -n C-k select-pane -U
	 #bind -n C-l select-pane -R
     #
	 ### Change Window
	 #bind [ select-window -t -1
	 #bind ] select-window -t +1
     #
	 ### Change session
	 #unbind ,
	 #unbind .
	 #bind , previous-window \; switch-client -T prefix
	 #bind . next-window \; switch-client -T prefix
     #
	 ### Resize pane
	 #bind C-h resize-pane -L 3 \; switch-client -T prefix
	 #bind C-j resize-pane -D 2 \; switch-client -T prefix
	 #bind C-k resize-pane -U 2 \; switch-client -T prefix
	 #bind C-l resize-pane -R 3 \; switch-client -T prefix
     #
	 ### Swap panes
	 #bind J swap-pane -D \; switch-client -T prefix
	 #bind K swap-pane -U \; switch-client -T prefix
     #
	 ### Change window, create if not created yet.
	 #bind-key 1 if-shell 'tmux select-window -t :1' ''' 'new-window -t :1'
	 #bind-key 2 if-shell 'tmux select-window -t :2' ''' 'new-window -t :2'
	 #bind-key 3 if-shell 'tmux select-window -t :3' ''' 'new-window -t :3'
	 #bind-key 4 if-shell 'tmux select-window -t :4' ''' 'new-window -t :4'
	 #bind-key 5 if-shell 'tmux select-window -t :5' ''' 'new-window -t :5'
	 #bind-key 6 if-shell 'tmux select-window -t :6' ''' 'new-window -t :6'
	 #bind-key 7 if-shell 'tmux select-window -t :7' ''' 'new-window -t :7'
	 #bind-key 8 if-shell 'tmux select-window -t :8' ''' 'new-window -t :8'
	 #bind-key 9 if-shell 'tmux select-window -t :9' ''' 'new-window -t :9'
	 #bind-key 0 if-shell 'tmux select-window -t :0' ''' 'new-window -t :0'
	#'';
    #};
}
