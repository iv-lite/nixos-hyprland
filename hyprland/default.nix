{ inputs
, config
, pkgs
, ...
}:

{
  imports = [
    ./home.nix
    inputs.hyprland.homeManagerModules.default
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    xwayland.enable = true;

    # # Optional
    # # Whether to enable hyprland-session.target on hyprland startup
    systemd.enable = true;
    systemd.variables = [ "--all" ];

    extraConfig = ''
      ${builtins.readFile ./hyprland.conf}
    '';

    plugins = [
      inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
    ];
  };

}
