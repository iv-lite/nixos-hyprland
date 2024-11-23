{ config, pkgs, user, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      # noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      roboto

      font-awesome
      font-awesome_5
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
        emoji = [ "Noto Color Emoji" ];
        monospace = [
          "Noto Sans Mono"
          "emoji"
        ];
        sansSerif = [
          "Noto Sans"
          "emoji"
        ];
        serif = [
          "Noto Serif"
          "emoji"
        ];
      };
    };
  };

}
