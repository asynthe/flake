{ config, ... }: {

    boot = {
        consoleLogLevel = 0;
        kernelParams = [
            "quiet"
            "splash"
            "log_level=3"
            "rd.systemd.show_status=false"
            "rd.udev.log_level=3"
            "rd.udev.log_priority=3"
            "button.lid_init_state=open"
        ];
    };
}
