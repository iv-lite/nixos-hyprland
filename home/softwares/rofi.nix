{ config, pkgs, ... }:

{

  home.file = {
    "${config.xdg.configHome}/rofi/themes" = {
      source = ../../resources/.config/rofi/themes;
      recursive = true;
    };
  };

  programs.rofi = {
    enable = true;
    cycle = true;
    terminal = "${pkgs.ghostty}/bin/ghostty";

    theme = "nord";
    font = "Noto Sans Mono";

    plugins = [
      pkgs.rofi-calc
      pkgs.rofi-emoji
      pkgs.rofi-systemd
    ];

    extraConfig = {
      show-icons = true;
      kb-cancel = "Escape,Super+space";
      modi = "drun,run,combi,window,ssh,filebrowser,calc,emoji";
      sort = true;

      line-margin = 10;

      display-ssh = "";
      display-run = "";
      display-drun = "";
      display-window = "";
      display-combi = "";
    };
  };
}
