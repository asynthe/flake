{ pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)
            python3
	    twine
        ;

	inherit (pkgs.python311Packages)
	    faker
	    pandas
	    scapy
	    requests
	    datetime
	    pyftpdlib
	    openpyxl # read/write Excel 2010 xlsx/xlsm/xltx/xltm files.
	    defusedxml # defusing XML bombs and other exploits
	    #web-server

	    # Math
	    scipy

	    # Fun
	    #cbeams
	;
    };

    # TESTING
    #pip
    #markdown
    ### pywal + deps ###
    #pywal # test
    #pillow # for colorz
    #colorz # not working
    #colorthief # not working
    ### Emacs EAF - TESTING ###
    #pyqt6 sip qtpy epc lxml pyqt6-webengine # for eaf
    #qrcode # eaf-file-browser
    #pysocks # eaf-browser
    #pymupdf # eaf-pdf-viewer
    #pypinyin # eaf-file-manager
    #psutil # eaf-system-monitor
    #retry # eaf-markdown-previewer
}
