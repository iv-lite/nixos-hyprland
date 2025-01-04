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
  # environment.systemPackages = with pkgs; [
  #   greetd.regreet
  #   cage
  # ];

  services.displayManager = {
    enable = true;

    sessionPackages = [
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland
    ];
    defaultSession = "Hyprland";
  };

  environment.etc = {
    # "greetd/config.toml" = {
    #   source = ../resources/greetd/config.toml;
    #   user = "greeter";
    #   group = "greeter";
    # };

    "greetd/regreet.toml" = lib.mkForce {
      source = ../resources/greetd/regreet.toml;
      user = "greeter";
      group = "greeter";
    };

    "greetd/login.background.jpg" = {
      source = ../resources/greetd/login.background.jpg;
      user = "greeter";
      group = "greeter";
    };
  };

  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        command = "${pkgs.cage}/bin/cage -s -mlast -- ${pkgs.greetd.regreet}/bin/regreet";
        user = "greeter";
      };
    };
  };

  services.cage = {
    enable = true;
    user = "greeter";
  };
  programs.regreet.enable = true;
}

