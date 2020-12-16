# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./hardware.nix
      ./boot.nix
      ./environment/default.nix
      ./services/default.nix
      ./fonts.nix
      ./networking.nix
      ./virtualization.nix 
      ./nixpkgs/config.nix
      ./u2f.nix
    ];
    hardware.sane.enable = true;
    hardware.sane.extraBackends = [ 
      pkgs.utsushi 
      #pkgs.epkowa 
    ];
    services.udev.packages = [ pkgs.utsushi ];
    #hardware.sane.extraBackends = [ pkgs.epkowa ];
  # Set your time zone.
  time.timeZone = "Europe/Prague";
  
  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "20.09"; # Did you read the comment?
 
}
