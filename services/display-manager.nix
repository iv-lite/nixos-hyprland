{
  lib,
  inputs,
  config,
  pkgs,
  ...
}:
{
  services = {
    displayManager = {
      sessionPackages = [
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland
      ];
      sddm = {
        enable = true;
        wayland.enable = true;
        sugarCandyNix = {
          enable = true;
          settings = {
            Background = lib.cleanSource ../resources/.config/hypr/background.jpg;
            ScreenWidth = 1920;
            ScreenHeight = 1080;
            FormPosition = "left";
            HaveFormBackground = true;
            PartialBlur = true;
            Font = "FontAwesome";
          };
        };
      };
    };
  };
}
