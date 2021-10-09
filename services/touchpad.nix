{ config, pkgs, ... }:

{
  # Enable touchpad support.
  # It is needed to explicitly disable libinput if we want to use synaptics
  #services.xserver.libinput.enable = false;
  
  # Enable Lenovo/IBM touchpad support
  #services.xserver.synaptics.enable = true;
 
}
