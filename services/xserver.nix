{ config, pkgs, ... }:

{
 #  Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "us";
    xkbOptions = "eurosign:e";
  
     desktopManager = {
     #  default = "none";
       xterm.enable = false;
     };
  
    displayManager = {
      defaultSession = "none+i3";
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
       	i3-gaps
        #i3blocks
      ];
    };
   
    #windowManager.i3.package = pkgs.i3-gaps;
 
    libinput.enable = false;

    synaptics = {
      enable = true;
      vertTwoFingerScroll = true;
      horizTwoFingerScroll = true;
      twoFingerScroll = true;
      tapButtons = false;
    };
  };
}
