{ inputs, config, pkgs, ... }:

{
  imports = [
    ./packages/thunar.nix
  ];

  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";

    systemPackages = with pkgs; [
      xdg-desktop-portal-hyprland
      polkit
      grim # screenshot functionality
      slurp # screenshot functionality
      wlogout
      wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
      mako # notification system developed by swaywm maintainer
      pamixer
      playerctl
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

  services.blueman.enable = true;

  programs.light.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
