{ 
    boot = {
        consoleLogLevel = 0;
        initrd.verbose = false;
        plymouth.enable = true;
        kernelParams = [
            "quiet"
            "splash"
            "vga=current"
            "rd.systemd.show_status=false"
            "rd.udev.log_level=3"
            "udev.log_priority=3"
            "boot.shell_on_fail"

            "rd.udev.log_priority=3"
            "button.lid_init_state=open"
            "log_level=3"
        ];
    };
}
