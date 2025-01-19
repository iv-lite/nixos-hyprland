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
    package = pkgs.rofi-wayland;

    cycle = true;
    terminal = "${pkgs.ghostty}/bin/ghostty";

    theme = "nord";
    font = "FontAwesome";

    plugins = with pkgs; [
      (rofi-calc.override { rofi-unwrapped = rofi-wayland-unwrapped; })

      rofi-emoji
      rofi-systemd
    ];

    extraConfig = {
      show-icons = false;
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
