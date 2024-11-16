{ inputs, config, pkgs, user, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      vim
      wget
      nixpkgs-fmt
      pkgs._1password-gui
      vulkan-validation-layers
      xdg-utils
      pass-wayland
      proton-pass
      wayland-pipewire-idle-inhibit
      ddcutil

      libinput
      cmake
      meson
      cpio

      libsForQt5.qt5ct
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
      solaar
      logitech-udev-rules
      cava

      foot
    ];

    sessionVariables.NIXOS_OZONE_WL = "1";
    variables.EDITOR = "vim";
  };

  programs.firefox.enable = true;
  programs.hyprlock.enable = true;
  programs.light.enable = true;

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images


  programs.hyprland = {
    enable = true;
    # package = pkgs.hyprland;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    # xwayland.enable = true;
  };
}
