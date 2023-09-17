{pkgs, ...}: {
  #programs.zsh = {
  #enable = true;
  #enableAutosuggestions = true;
  #syntaxHighlighting = {
  #enable = true;
  #styles = ;
  #package = ;
  #};
  #initExtra = ''
  #bindkey '^f' autosuggest-accept
  #'';
  #};

  home.packages.pkgs.uutils-coreutils.override {prefix = "";} # coreutils replace with uutils
  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      # Shell
      zsh
      dash
      fish
      powershell
      nushell nu_scripts

      # Replacements
      bat # for cat
      eza # for ls
      zoxide # for cd
      fd # for find

      # Tools
      starship
      git
      tmux
      neovim #vim
      skim #fzf

      # Apps
      lf
      ueberzugpp # file manager
      yt-dlp
      ripdrag # drag-and-drop for terminal
      cli-visualizer
      cava # audio visualizer
      pipes-rs #pipes
      peaclock #tty-clock
      cmatrix
      hollywood
      figlet
      lolcat
      pfetch #neofetch #ipfetch #macchina
      pv

      # Customization
      pywal
      wpgtk
      colorz

      # Code formatters
      nixfmt
      alejandra # nix
      ;
  };
}
