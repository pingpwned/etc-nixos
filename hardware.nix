{ config, pkgs, ... }:

{
  sound.enable = true;

  hardware = {
    bluetooth.enable = true;

    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
    };

    # Steam support
    # opengl.driSupport32Bit = true;
    # pulseaudio.support32Bit = true;
  };
}
