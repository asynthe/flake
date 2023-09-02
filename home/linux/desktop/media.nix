{pkgs, ...}: {
  home.packages = with pkgs; [

    # Video
    kdenlive #davinci-resolve
    obs-studio
    mpv # video player
    hypnotix # tv
    ffmpeg
    mediainfo # video/audio metadata

    # 3D Modelling
    #blender #blender-hip
    #openscad
    meshlab
    f3d # fast and minimalistic 3D viewer
    fstl # The fastest STL file viewer

    # Image
    darktable
    rawtherapee
    #inkscape-with-extensions #inkscape
    gimp-with-plugins #gimp # Replaced for flatpak gimp + photogimp.
    #krita
    imagemagick # image editing
    exif # image metadata

    # CD / DVD Tools
    #cdemu-client
    #cdemu-daemon
    #gcdemu

    # DAWs - Digital Audio Workstation
    ardour
    bitwig-studio
    reaper

    # DJ mixer
    mixxx

    # Tools
    #yabridge #yabridgectl
    linthesia # Synthesia replacement
    asunder # CD ripper and encoder
    #ocenaudio #audacity
    cadence # catia
    patchance # JACK patchbay GUI
    helvum # gtk patchbay for pipewire
    easyeffects
    qpwgraph
    mp3gain

    # Audio visualizers
    cli-visualizer
    cava

    # Sound volume
    alsamixer
    pavucontrol
    pulsemixer
    ncpamixer

    # Music player
    playerctl # Manage audio daemon
    ncmpcpp
    cmus
    qmmp
    spotify spotify-tui #spotify-qt 
    #spotify-tray

    # Tag editors
    easytag
    tagger
    #puddletag
    #kid3

    # Soulseek
    nicotine-plus #soulseekqt
  ];
}
