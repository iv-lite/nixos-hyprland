{ config, pkgs, ... }:
{
  home.file = {
    "${config.xdg.configHome}/wofi/style.css" = {
      source = ../../resources/.config/wofi/style.css;
    };
  };

  programs.wofi = {
    enable = true;
    settings = {
      prompt = "";
      height = 260;
      dynamic_lines = true;
      insensitive = true;
      hide_scroll = true;
    };
  };
}
