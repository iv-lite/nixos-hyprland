{ config, pkgs, user, ... }:

{
  fonts = {
    packages = with pkgs; [
      corefonts
      ubuntu_font_family
      powerline-fonts
      font-awesome
      source-code-pro
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      emojione
      kanji-stroke-order-font
      ipafont

      liberation_ttf
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts

      font-awesome
      powerline-symbols
    ];

    fontconfig = {
      # dpi = 96;
      #dpi = 180;
      # hinting.autohint = false;
      # ultimate.enable = false;
      # penultimate.enable = false;
      # useEmbeddedBitmaps = true;
      antialias = true;

      defaultFonts = {
        monospace = [
          "Fira Code"
          "FiraCode Nerd Font"
          "DejaVu Sans Mono"
          "Noto Mono"
        ];
        sansSerif = [
          "Fira Sans"
          "Ubuntu"
          "DejaVu Sans"
          "Noto Sans"
        ];
        serif = [
          "Roboto Slab"
          "PT Serif"
          "Liberation Serif"
          "Noto Serif"
        ];
      };
    };
  };

}
