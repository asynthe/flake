{ config, ... }: {

    programs.mosh = {
        enable = true;
        #withUtempter = false; # Default true.
    };
}
