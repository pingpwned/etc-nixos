{ config, pkgs, ... }:

{
  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    dejavu_fonts
    twitter-color-emoji
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "SourceCodePro" ]; })
    powerline-fonts
    symbola
  ];
  fonts.enableDefaultFonts = true;
  fonts.fontconfig = {
     enable = true;
     antialias = true;
     hinting.enable = true;
     defaultFonts.emoji = ["Noto Color Emoji"];
  };
}
