{ config, pkgs, ... }:

{
  # Set your time zone.
  time.timeZone = "Europe/Paris";
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/vda";
  };

  boot.cleanTmpDir = true;
}
