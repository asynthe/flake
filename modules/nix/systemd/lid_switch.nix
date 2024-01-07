{ config, pkgs, ... }: {

  # Don't suspend/hibernate when closing laptop lid
  # Options: ignore, poweroff, reboot, halt, kexec, suspend, hibernate, hybrid-sleep, suspend-then-hibernate, lock.
  services.logind.lidSwitch = "suspend"; # or
  #services.logind.extraConfig = "HandleLidSwitch=ignore";

}
