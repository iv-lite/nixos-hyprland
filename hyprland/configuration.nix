{ inputs, config, pkgs, ... }:
# let
#   pkgs-hyprland = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
# in

{
  # nix.settings = {
  #   substituters = [ "https://hyprland.cachix.org" ];
  #   trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  # };


  imports = [
    ./packages/thunar.nix
  ];

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gnome
    ];

    config = {
      common = {
        default = [ "gtk" ];
      };
    };

    configPackages = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";

    systemPackages = with pkgs; [
      libinput
      cmake
      meson
      cpio

      hyprpaper

      grim # screenshot functionality
      slurp # screenshot functionality
      wlogout
      wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
      mako # notification system developed by swaywm maintainer
      pamixer
      playerctl
      tofi
      cliphist
      arc-theme
      papirus-icon-theme
      waybar
      pavucontrol
    ];
  };

  services.blueman.enable = true;
  services.libinput.enable = true;
  services.hypridle.enable = true;

  programs.hyprlock.enable = true;
  programs.light.enable = true;
  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "monospace:size=10";
      };
    };
  };

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    xwayland.enable = true;
  };
}
