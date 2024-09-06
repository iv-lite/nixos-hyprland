{ inputs, config, pkgs, ... }:

{

  dconf = {
    settings = {
      "org/gnome/desktop/interface" = {
        gtk-theme = "Arc-Dark";
        color-scheme = "prefer-dark";
      };
    };
  };

  gtk = {
    enable = true;
    font.name = "FontAwesome";
    theme = {
      name = "Arc-Dark";
      package = pkgs.arc-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
}
