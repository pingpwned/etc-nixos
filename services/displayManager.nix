{ config, pkgs, ... }:

{
  # Default displayManager is LightDM
  # Enable SDDM displayManager
  # services.xserver.displayManager.sddm.enable = true;
  
  # Enable the KDE Desktop Environment
  # services.xserver.displayManager.slim.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;
  
  # Enable for Gnome Desktop Environment
  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome3.enable = true;

}
