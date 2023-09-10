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

  home.packages = with pkgs; [
    # shell
    zsh
    dash
    fish
    starship
    powershell
    nushell
    nu_scripts

    # replacements
    (pkgs.uutils-coreutils.override {prefix = "";}) # coreutils replace with uutils
    bat # for cat
    eza # for ls
    zoxide # for cd
    fd # for find

    # tools
    git
    tmux
    neovim #vim
    skim #fzf

    # apps
    lf
    ueberzugpp # file manager
    xplr
    yt-dlp
    ripdrag # drag-and-drop for terminal

    # fun
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

    # customization
    pywal
    wpgtk
    colorz

    # code formatters
    nixfmt
    alejandra # nix
  ];
}
