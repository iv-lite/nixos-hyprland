{ lib
, inputs
, config
, pkgs
, ...
}:
let
  load = pkgs.writeShellScript "load" ''
    export XDG_SESSION_TYPE=wayland
    export QT_QPA_PLATFORM=wayland
    export XDG_SESSION_DESKTOP=Hyprland
    export XDG_CURRENT_DESKTOP=Hyprland
    export WLR_RENDERER=vulkan

    ${pkgs.hyprland}/bin/Hyprland --config /etc/greetd/hyprland.conf
  '';
in
{
  environment.systemPackages = with pkgs; [
    cage
  ];

  environment.etc = {
    "greetd/regreet.toml" = lib.mkForce {
      source = ../resources/greetd/regreet.toml;
      user = "greeter";
      group = "greeter";
    };

    "greetd/hyprland.conf" = {
      source = ../resources/greetd/hyprland.conf;
      user = "greeter";
      group = "greeter";
    };

    "greetd/login.background.jpg" = {
      source = ../resources/greetd/login.background.jpg;
      user = "greeter";
      group = "greeter";
    };
  };

  services.displayManager.defaultSession = "hyprland-uwsm";

  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        command = "${pkgs.hyprland}/bin/Hyprland --config /etc/greetd/hyprland.conf";
        user = "greeter";
      };
    };
  };
  programs.regreet.enable = true;
}

