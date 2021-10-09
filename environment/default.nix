{ config, pkgs, ... }:

{

  imports = [
    ./vi.nix
    ./programs.nix
    ./interactiveShellInit.nix
    ./sessionVariables.nix
    ./users.nix
  ];

  # System-wide packages
  environment.systemPackages = with pkgs; [
    # System utilities
    ark dmidecode gitAndTools.gitFull gnupg gparted htop ntfs3g usbutils unar unzip wget rxvt-unicode xosview2 xcompmgr nodejs-12_x

    # Desktop utilities
    chromium #brave #dropbox
    diceware evince filelight firefox gimp-with-plugins keepassxc killall libreoffice-fresh nextcloud-client #notepadqq
    peek phototonic signal-desktop #slack
    tdesktop thunderbird #thunderbird-68
    vlc wine feh
    spotify-tui spotifyd

    #tightvnc

    blender
    flameshot
    xsane
    imagemagickBig
    #qemu
    #virt-manager

    # Gnome specifics and utilities
    gnome3.gnome-tweaks
    gnomeExtensions.dash-to-panel
    # need for virt-manager module detection
    # gnome3.dconf

    # KDE specifics and utilities
    # kcalc
    # krusader
    # spectacle

    # Python Trezor packages
    (python3.withPackages(ps: with ps; [ trezor trezor_agent pillow scipy imageio ]))

    # Optional stuff
    # spotify
    # steam
    wireguard
  ];

}
