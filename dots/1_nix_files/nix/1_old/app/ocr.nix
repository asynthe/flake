{ pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)
            tesseract
	    qt-box-editor
	    easyocr
	;
    };
};
