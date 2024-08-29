{ config, pkgs, user, ... }:

{
  environment.systemPackages = with pkgs; [
    ddcutil
    vim
    brightnessctl
    wget
    nixpkgs-fmt
    pkgs._1password-gui
    wayland
    xwayland
    vulkan-validation-layers
  ];
  environment.variables.EDITOR = "vim";

  programs.firefox.enable = true;
}
