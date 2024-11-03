{ config, pkgs, user, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
    nixpkgs-fmt
    pkgs._1password-gui
    vulkan-validation-layers
    xdg-utils
    pass-wayland
    unstable.proton-pass
  ];
  environment.variables.EDITOR = "vim";

  programs.firefox.enable = true;
}
