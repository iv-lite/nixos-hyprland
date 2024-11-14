{ inputs
, config
, pkgs
, ...
}:

{
  imports = [
    inputs.hyprland.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    hyprlandPlugins.hyprsplit
  ];

  home.file = {
    "${config.xdg.configHome}/hypr" = {
      source = ../resources/.config/hypr;
      recursive = true;
    };

    "${config.xdg.configHome}/foot" = {
      source = ../resources/.config/foot;
      recursive = true;
    };

    "${config.xdg.configHome}/mako" = {
      source = ../resources/.config/mako;
      recursive = true;
    };

    "${config.xdg.configHome}/tofi" = {
      source = ../resources/.config/tofi;
      recursive = true;
    };

    "${config.xdg.configHome}/waybar" = {
      source = ../resources/.config/waybar;
      recursive = true;
    };

    "${config.xdg.configHome}/wlogout" = {
      source = ../resources/.config/wlogout;
      recursive = true;
    };

    "${config.xdg.configHome}/xdg-desktop-portal" = {
      source = ../resources/.config/xdg-desktop-portal;
      recursive = true;
    };
  };


  wayland.windowManager.hyprland = {
    enable = true;
    # package = pkgs.hyprland;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    xwayland.enable = true;

    # # Optional
    # # Whether to enable hyprland-session.target on hyprland startup
    systemd.enable = true;
    systemd.variables = [ "--all" ];

    extraConfig = ''
      ${builtins.readFile ../resources/.config/hyprland.conf}
    '';

    plugins = [
      pkgs.hyprlandPlugins.hyprsplit
    ];
  };

}
