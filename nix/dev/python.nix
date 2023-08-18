{pkgs, ...}:

let
  python-pkgs = ps: with ps; [
    pandas
    requests
    scapy
  ];

in {

  home.packages = with pkgs; [

    (pkgs.python3.withPackages python-pkgs)

  ];

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

  #environment.systemPackages = with pkgs; [
  #(pkgs.python3.withPackages python-pkgs)
  #];
}
