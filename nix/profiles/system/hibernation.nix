{
    # -------------------------------------------------
    # Hibernation mode test

    # To hibernate the PC using the created swap, add the next to boot configuration.
    # Check how to calculate the swap file offset.
    # https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate#Acquire_swap_file_offset
    #boot = {
        #kernelParams = [ "resume_offset=533760" ];
        #resumeDevice = "/dev/disk/by-label/nixos";
    #};
}
