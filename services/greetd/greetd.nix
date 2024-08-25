{
    config,
    pkgs,
    ...
}: let 
  load = pkgs.writeShellScript "load" ''
    export XDG_SESSION_TYPE=wayland
    export QT_QPA_PLATFORM=wayland
    export XDG_SESSION_DESKTOP=Hyprland
    export XDG_CURRENT_DESKTOP=Hyprland

    ${pkgs.hyprland}/bin/Hyprland --config /etc/nixos/services/greetd/hyprland.conf
  '';
in {

  environment.systemPackages = [
    pkgs.greetd.regreet
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

  # programs.regreet = { 
  #   enable = true;
  #   settings = {
  #     background = {
  #       path = "/etc/greetd/login.background.jpg";
  #      fit = "cover";
  #    };
  #     GTK = {
  #      application_prefer_dark_theme = true;
  #      cursor_theme_name = "Adwaita";  
  #     };
  #   };
  #   # settings = pkgs.lib.mkForce "/etc/nixos/services/greetd/regreet.toml";
  # };

  # services.greetd = {
  #   enable = true;
  #  };
}
