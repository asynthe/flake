{ pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)
        
            # DAWs - Digital Audio Workstation
            #ardour
            #renoise
            #reaper
            #bitwig-studio # paid
    
            # DJ mixer
            mixxx

            # Audio editors
            #ocenaudio #audacity

            # Music Players
            #cmus
            #qmmp

            # MP3
            #lame

            # Tag editors
            #easytag
            #tagger
            #puddletag
            #kid3

            # Tools
            sox
            mediainfo
            #losslessaudiochecker # LAC
            #exactaudiocopy # EAC
            #friture # Real-time audio analyzer.

            # CD / DVD Tools
            #cdemu-client #cdemu-daemon
            #gcdemu
        ;
    };
}
