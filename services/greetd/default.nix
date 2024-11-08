{ lib
, inputs
, config
, pkgs
, ...
}:
{
  environment.systemPackages = with pkgs; [
    cage
    greetd.regreet
    # cage
    # greetd.regreet
  ];

  environment.etc = {
    "greetd/config.toml" = {
      source = ./.config/config.toml;
      user = "greeter";
      group = "greeter";
    };

    "greetd/regreet.toml" = {
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
        command = "cage -s -- regreet";
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
  #   # settings = {
  #   #   background = {
  #   #     path = "/etc/greetd/login.background.jpg";
  #   #     fit = "cover";
  #   #   };

  #   #   GTK = pkgs.lib.mkForce {
  #   #     application_prefer_dark_theme = true;
  #   #     font_name = "FontAwesome";
  #   #     cursor_theme_name = "Adwaita";
  #   #     icon_theme_name = "Papirus-Dark";
  #   #     theme_name = "Arc-Dark";
  #   #   };

  #   #   commands = {
  #   #     reboot = [ "systemctl" "reboot" ];
  #   #     poweroff = [ "systemctl" "poweroff" ];
  #   #   };

  #   #   appearance = {
  #   #     greeting_msg = "Lite-Desk";
  #   #   };
  #   # };
  # };
}
