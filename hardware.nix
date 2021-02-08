{ config, pkgs, ... }:

{
  sound.enable = true;

  hardware = {
    bluetooth.enable = true;

    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
      systemWide = true;
      extraConfig = ''
        unload-module module-native-protocol-unix
        load-module module-native-protocol-unix auth-anonymous=1
      '';
    };

    # Steam support
    # opengl.driSupport32Bit = true;
    # pulseaudio.support32Bit = true;
  };
}
