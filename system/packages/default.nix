{ config, pkgs, user, ... }:

{
  environment.systemPackages = with pkgs; [
    ddcutil
    vim
    brightnessctl
    wget
    nixpkgs-fmt
    pkgs._1password-gui
    vulkan-validation-layers

    proton-pass
  ];
  environment.variables.EDITOR = "vim";

  programs.firefox.enable = true;
}
