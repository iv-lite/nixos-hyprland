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
    #   # cage
    greetd.regreet
  ];

  environment.etc = {
    "greetd/config.toml" = {
      source = ./.config/config.toml;
      user = "greeter";
      group = "greeter";
    };

    "greetd/regreet.toml" = lib.mkForce {
      source = ./.config/regreet.toml;
      user = "greeter";
      group = "greeter";
    };


    "greetd/environments" = {
      source = ./.config/environments;
      user = "greeter";
      group = "greeter";
    };

    "greetd/sources" = {
      source = ./.config/sources;
      user = "greeter";
      group = "greeter";
    };


    "greetd/hyprland.conf" = {
      source = ./.config/hyprland.conf;
      user = "greeter";
      group = "greeter";
    };

    "greetd/hyprpaper.conf" = {
      source = ./.config/hyprpaper.conf;
      user = "greeter";
      group = "greeter";
    };

    "greetd/login.background.jpg" = {
      source = ./.config/login.background.jpg;
      user = "greeter";
      group = "greeter";
    };
  };

  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        # command = "cage -s -- regreet";
        command = "${load}";
        # command = "${config.programs.regreet.package}/bin/regreet";
        user = "greeter";
      };
    };
  };

  services.displayManager = {
    enable = true;

    sessionPackages = [
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland
    ];
    defaultSession = "hyprland";
  };

  # programs.regreet = {
  #   enable = true;
  #   settings = lib.mkForce "/etc/greetd/regreet.toml";
  # };
}
