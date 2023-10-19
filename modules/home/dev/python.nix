{pkgs, ...}: {

  #home.packages = with pkgs; [
  home.packages = builtins.attrValues {
    inherit 
      (pkgs.python3.withPackages (ps:
        with ps; [
          faker
          pandas
          scapy
          requests
          datetime
          openpyxl # read/write Excel 2010 xlsx/xlsm/xltx/xltm files.
          defusedxml # defusing XML bombs and other exploits
        ]))
	;
  };
  #];

  # TESTING
  #pip
  #markdown
  #cbeams
  ### pywal + deps ###
  #pywal # test
  #scipy # for colorz
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
  #];
  #in
}
