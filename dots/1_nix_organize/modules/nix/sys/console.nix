{ config, pkgs, ... }: {

    # Custom console
    console = {
        earlysetup = true;
        font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
        packages = with pkgs; [ terminus_font ];
        keyMap = "us";
        useXkbOptions = true; # use xkbOptions in tty.
    };
}
