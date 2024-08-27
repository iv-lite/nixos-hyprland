{ inputs, config, pkgs, split-monitor-workspaces, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    
    xwayland.enable = true;

    # # Optional
    # # Whether to enable hyprland-session.target on hyprland startup
    systemd.enable = true;
    systemd.variables = ["--all"];

    extraConfig = ''
      ${builtins.readFile ../.config/hypr/hyprland.conf}
    '';

    plugins = [
      # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprtrails
      split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
    ];
  };

}
