{ config
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
    # ${pkgs.greetd.regreet}/bin/regreet --config /etc/greetd/.config/regreet.toml
    # ${pkgs.greetd.regreet}/bin/regreet
  '';
in
{
  # programs.regreet.enable = true;

  environment.etc = {
    "greetd/config.toml" = {
      source = ./.config/config.toml;
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


  environment.systemPackages = with pkgs; [
    greetd.regreet
  ];

  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        command = "${load}";
        user = "greeter";
      };
    };
  };

  programs.regreet = {
    enable = true;
    settings = pkgs.lib.mkDefault ./regreet.toml;
  };
}
