{ inputs, config, pkgs, ... }:

{

  environment.systemPackages = [
    pkgs.arc-theme
    pkgs.papirus-icon-theme
  ];

  # gtk = {
  #     enable = true;
  #     # font.name = "TeX Gyre Adventor 10";
  #     theme = {
  #       name = "Arc-Dark";
  #       package = pkgs.arc-theme;
  #     };
  #     iconTheme = {
  #       name = "Papirus-Dark";
  #       package = pkgs.papirus-icon-theme;
  #     };

  #     gtk3.extraConfig = {
  #     Settings = ''
  #       gtk-application-prefer-dark-theme=1
  #     '';
  #   };

  #   gtk4.extraConfig = {
  #     Settings = ''
  #       gtk-application-prefer-dark-theme=1
  #     '';
  #   };
      
  # };
}