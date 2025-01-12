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
      protonmail-desktop

      wayland-pipewire-idle-inhibit
      ddcutil
      brightnessctl

      libinput
      cmake
      meson
      cpio
      xarchiver

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
      youtube-music

      discord
      foot
      vscode-fhs

      # Useful for virtualisation
      podman-desktop
      dive # look into docker image layers
      podman-tui # status of containers in the terminal
      docker-compose # start group of containers for dev
      #podman-compose # start group of containers for dev
    ];

    sessionVariables.NIXOS_OZONE_WL = "1";
    variables.EDITOR = "vim";
  };

  programs.firefox.enable = true;
  programs.hyprlock.enable = true;
  programs.light.enable = true;
  programs.gnome-disks.enable = true;

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images

  programs.dconf.enable = true;

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    # xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    xdgOpenUsePortal = true;
  };

  # Enable common container config files in /etc/containers
  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;
      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;
      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
}
