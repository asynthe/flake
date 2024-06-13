alias waifu='nsxiv -t ~/main/ベンハミン/ero/3d_girls' # FIXING
#alias waifu-irl='nsxiv -t ~/sync/sys/wallpapers/2d-girls' # FIXING
#alias wall-anime-random=

# Wallpaper - Nitrogen [X11]
#alias xinit='nvim ~/.xinitrc'
#alias xwall='fd . /home/asynthe/sync/system/wallpaper -e jpg -e png | fzf | xargs feh' # INSTALL FEH AND FIX

# xrandr commands
#alias hdmi='xrandr --output eDP-1 --mode 1920x1080 --rate 144.00 && xrandr --output HDMI-1-0 --primary --mode 1920x1080 --rate 60.00 --right-of eDP-1'
#alias hdmi-bigtv='xrandr --output eDP-1 --primary --mode 1920x1080 --rate 144.00 --output HDMI-1-0 --mode 1920x1080 --rate 60.00 --right-of eDP-1'
#alias hdmi-off='xrandr --output HDMI-1-0 --off'

[[ $- != *i* ]] && return

export PATH="$HOME/sync/dots/script/bin:$PATH"
export PATH="$HOME/sync/dots/script/bash/git:$PATH"

#export PATH="$HOME/.cargo/bin:$PATH"
#export PATH="$HOME/.local/bin:$PATH"
#export PATH="/usr/lib/ccache/bin:${PATH}"

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.emacs.d/bin" ] ;
  then PATH="$HOME/.emacs.d/bin:$PATH"
fi

if [ -d "$HOME/.config/emacs/bin/" ] ;
  then PATH="$HOME/.config/emacs/bin/:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi

if [ -d "/var/lib/flatpak/exports/bin/" ] ;
  then PATH="/var/lib/flatpak/exports/bin/:$PATH"
fi

if [ -z "$XDG_CONFIG_HOME" ] ; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi
if [ -z "$XDG_DATA_HOME" ] ; then
    export XDG_DATA_HOME="$HOME/.local/share"
fi
if [ -z "$XDG_CACHE_HOME" ] ; then
    export XDG_CACHE_HOME="$HOME/.cache"
fi

export TERM='xterm-256color'
export QT_STYLE_OVERRIDE=adwaita-dark

export EDITOR='nvim'
export BROWSER='firefox'
export READER='zathura'
export FILE='lf'

alias ssh='ssh -i $HOME/sync/pass/ssh/thinkpad/thinkpad'
export GNUPGHOME=$HOME/sync/pass/gpg # default is $HOME/.gnupg
export PASSWORD_STORE_DIR=$HOME/sync/pass/pass # default is $HOME/.password-store

export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml # Default is $HOME/.config/starship.toml, also $ZDOTDIR/starship/starship.toml to have inside zsh folder.
export WAYFIRE_CONFIG_FILE=$HOME/.config/wayfire/wayfire.ini # Instead of $HOME/.config/wayfire.ini

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
HISTORY_IGNORE="(ls|ls *|cd|cd *|bat *|cat *|pwd|clear|history)"

TMOUT=420
TRAPALRM() { unimatrix -s 93 }
#TRAPALRM() { pipes-rs }

eval "$(starship init zsh)"
#eval "$(starship init bash)" # if .bashrc

#PROMPT="> "
#RPROMPT="にゃ~"
#RPROMPT="]"

eval "$(direnv hook zsh)"

setopt extended_glob
setopt no_flowcontrol
# shopt autocd for bashrc # cd with ..

bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

#bindkey -s '^I' 'pactl set-sink-volume 0 -5%; clear^M'
#bindkey -s '^O' 'pactl set-sink-volume 0 +5%; clear^M'

bindkey -s '^Q' 'qalc^M'
bindkey -s '^E' 'srczsh; clear^M'
bindkey -s '^T' 'tmux^M'

bindkey -r '^F'
bindkey -s '^F' 'lf^M'

bindkey -r '^V'
bindkey -s '^V' 'cava^M'

bindkey -s '^B' 'bluetuith^M'
bindkey -s '^N' 'ncmpcpp^M'
bindkey -s '^X' 'nvim^M'

bindkey -r '^Z' # Unbinded for tmux zoom pane instead of send into bg.

function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT

  ZVM_CURSOR_STYLE_ENABLED=true
  
  ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
  ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_UNDERLINE
}

source $ZDOTDIR/plugin/zsh-vi-mode/zsh-vi-mode.plugin.zsh

source $ZDOTDIR/plugin/zsh-autosuggestions/zsh-autosuggestions.zsh

source $ZDOTDIR/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#(cat ~/.cache/wal/sequences &)
#cat ~/.cache/wal/sequences # Alternative (blocks terminal for 0-3ms)

alias update='nix flake update "/home/asynthe/sync/system/flake"'
alias upgrade='doas nixos-rebuild switch --flake "/home/asynthe/sync/system/flake"'
alias gc='doas nix-collect-garbage -d'

#alias emerge='doas emerge --ask'
#alias sync='doas emerge --sync'
#alias update='doas emerge -auvDN --keep-going @world'
#alias deselect='doas emerge --ask --deselect'
#alias clean='doas emerge --ask --depclean'
#alias makeconf='doas nvim /etc/portage/make.conf'
#alias dispatch='doas dispatch-conf'
#alias search='doas emerge --search'
#alias list-repo='eselect list'
#alias add-repo='doas eselect repository enable'
#alias del-repo=''

alias m='ncmpcpp'
alias @='neomutt'
alias n='nvim'
alias v='pulsemixer'
alias vv='alsamixer'
alias w='watch'

alias cp='rsync -ah --info=progress2'

alias h='history | sk'
alias -g c='bat' # cat -> bat
#alias -g cat='bat' # Problems with pywal

# CD -> Zoxide (?)
alias ,='cd -'
alias ..='cd ..'

# GREP
alias grep='grep -i --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Trash bin - trashy
#alias tr='trash'
#alias rm='echo "This is not the command you are looking for."; false'
#alias nil-tr='trash empty'

alias ls='eza --icons --group-directories-first'
alias la='eza --icons -a --group-directories-first'
alias ll='eza --long --group-directories-first'
alias lla='eza --long -a --group-directories-first'
alias lg='eza --long --git --group-directories-first'

alias fuck='doas !!'
alias sl='ls'

alias focker='docker'
alias dicker='docker'
alias dokcer='docker'

alias dsize='ncdu ${pwd}'

alias wshell='which $SHELL'
# XDG-MIME
alias wtype='xdg-mime query filetype'
alias wapp='xdg-mime query default'

#alias h='history | grep --color=auto'
alias irc='tmux attach-session -t weechat'
alias t='peaclock --config-dir ~/.config/peaclock'
alias time='peaclock --config-dir ~/.config/peaclock'
alias wtr='curl wttr.in/Perth'

alias bt='bluetuith'
alias -g pdf='zathura'
alias -g info='mediainfo'

alias yt='yt-dlp -f "bv[ext=mp4]+ba[ext=m4a]" --merge-output-format mp4'
alias yt-mp3='yt-dlp -f "ba" -x --audio-format mp3'

alias emacs='emacsclient -c -s emacs -a emacs'
alias -g nv='nvim' 
alias -g nvv='doas nvim'

alias doc='libreoffice'
alias docx='libreoffice'
alias word='libreoffice'
alias excel='libreoffice'

alias fstl='nvidia fstl'
alias f3d='nvidia f3d'

alias p='python'

alias swww-random='~/sync/archive/script/bash/swww/randomize.sh /home/asynthe/sync/system/wallpaper/favourite'
alias wall='fd . ~/sync/archive/wallpaper/img -e jpg -e png | sk | xargs swww img'
alias wallp='fd . ~/sync/archive/wallpaper/img -e jpg -e png | sk | tee >(xargs wal -i) >(xargs swww img)'
alias wallpy='fd . ~/sync/archive/wallpaper -e jpg -e png | ~/script/bash/fzf_preview | tee >(xargs wal -i) >(xargs swww img)'

alias video='fd . ~/sync/archive/wallpaper/video -e mp4 | sk | xargs mpvpaper -v -p -o "loop-file=inf" "*"'
alias loop='fd . ~/sync/system/wallpaper/loop -e mp4 | sk | xargs mpvpaper -v -s -o "loop-file=inf" eDP-1'

# TESTING #
alias pl='mpvpaper -v -s -o "shuffle loop-playlist=inf" "*" ~/sync/system/wallpaper/video/anime_playlist.m3u'
alias pl-na='mpvpaper -v -s -o "no-audio shuffle loop-playlist=" "*" ~/sync/system/wallpaper/video/anime_playlist.m3u'
alias tv-jp='mpvpaper -v -s "*" https://iptv-org.github.io/iptv/countries/jp.m3u'
alias tv-cl='mpvpaper -v -s "*" https://iptv-org.github.io/iptv/countries/cl.m3u'
alias tv-au='mpvpaper -v -s "*" https://i.mjh.nz/au/Perth/raw-tv.m3u8'

alias nvidia='~/sync/system/script/bash/nvidia_offload'
alias lock='~/sync/system/script/dots/lock_wp.sh'
alias msg='~/sync/system/script/gpg/message.sh'

alias nm='doas nmtui'
alias ports='ss -tulanp'
alias port='ss -naptu state listening'
alias ifconfig='echo "ipconfig is deprecated, use ip instead."; false'
#alias scan='iwctl station wlan0 scan' # not using iwd now

alias fightcade='flatpak run com.fightcade.Fightcade'
alias pinball='flatpak run com.github.k4zmu2a.spacecadetpinball'
alias upscayl='flatpak run org.upscayl.Upscayl'

alias rickroll='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

alias kernel-soul='aplay -c 2 -f S16_LE -r 44100 /dev/random'
alias kernel-soul-8hz='aplay /dev/random'
alias kernel-soul-pa='pacat /dev/urandom'

alias hypr='dbus-run-session Hyprland'
alias ani-on='hyprctl keyword animations:enabled 1'
alias ani-off='hyprgame'

alias book='fd . ~/sync/study/book --type f -e "pdf" -e "epub" | sk | xargs zathura'
alias books='fd . ~/sync/archive/book --type f -e "pdf" -e "epub" | sk | xargs zathura'
alias bookjp='fd . ~/sync/archive/jp/book -e "pdf" -e "epub" | sk | xargs zathura'

lfcd () {
    # `command` is needed in case `lfcd` is aliased to `lf`
    cd "$(command lf -print-last-dir "$@")"
}

#bindkey -s '^o' 'lfcd\n'
alias lf='lfcd'

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
alias yazi='yy'
