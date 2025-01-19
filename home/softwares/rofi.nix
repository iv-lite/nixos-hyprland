{ config, pkgs, ... }:

{

  home.file = {
    "${config.xdg.configHome}/rofi/themes" = {
      source = ../../resources/.config/rofi/themes;
      recursive = true;
    };
  };

  nixpkgs.overlays = [
    (final: prev: {
      rofi-calc = prev.rofi-calc.override { rofi-unwrapped = prev.rofi-wayland-unwrapped; };
      rofi-emoji = prev.rofi-emoji.override { rofi-unwrapped = prev.rofi-wayland-unwrapped; };
      rofi-systemd = prev.rofi-systemd.override { rofi-unwrapped = prev.rofi-wayland-unwrapped; };
    })
  ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    cycle = true;
    terminal = "${pkgs.ghostty}/bin/ghostty";

    theme = "nord";
    font = "FontAwesome";

    plugins = with pkgs; [
      (rofi-calc.override { rofi-unwrapped = rofi-wayland-unwrapped; })

      rofi-systemd
    ];

    extraConfig = {
      show-icons = false;
      kb-cancel = "Escape,Super+space";
      modi = "drun,run,combi,window,ssh,filebrowser,calc";
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
