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
  
  boot.kernel.sysctl."net.ipv4.conf.all.forwarding" = 1;
  boot.kernel.sysctl."net.ipv6.conf.all.forwarding" = 1;
}
