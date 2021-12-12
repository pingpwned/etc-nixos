{ config, pkgs, ... }:

{
  virtualisation = {
    # Enable DOcker
    docker.enable = true;

    # Enable VirtualBox
    virtualbox.host = {
      enable = true; 
      # Enable VirtualBox ExtensionPack (necessary for USB drivers higher than 1.1)
      enableExtensionPack = true;
      # Disable VirtualBox hardening
      # enableHardening = false;
    };

    libvirtd.enable = true;
  };

  users.extraGroups.vboxusers.members = [ "pwnedxyz" ];
}
