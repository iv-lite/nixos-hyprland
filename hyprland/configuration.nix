{ inputs, config, pkgs, ... }:

{
  imports = [
    ./packages/thunar.nix
  ];

  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";

    systemPackages = with pkgs; [
      polkit
      xwayland
      grim # screenshot functionality
      slurp # screenshot functionality
      wlogout
      wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
      mako # notification system developed by swaywm maintainer
      pamixer
      playerctl
      brightnessctl
      tofi
      foot
      cliphist
      polkit
      polkit_gnome
      arc-theme
      papirus-icon-theme
      hyprpaper
      waybar
      pavucontrol
    ];
  };

  services.blueman.enable;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
