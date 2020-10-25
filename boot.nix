{ config, pkgs, ... }:

{
  # Specify the encrypted disk
  boot = {
    initrd.luks.devices.root = {
      device = "/dev/nvme0n1p2"; 
      preLVM = true;
    };

    # Enable latest kernel updates
    # kernelPackages = pkgs.linuxPackages_latest;
  
    # Enable kvm for qemu
    # kernelModules = [ "kvm-intel" ];

    # Use the systemd-boot EFI boot loader.
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };
}
