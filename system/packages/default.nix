{ config, pkgs, user, ... }:

{
  environment.systemPackages = with pkgs; [
    ddcutil
  ];
}
