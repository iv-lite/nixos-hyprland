{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./display-manager.nix
    ./flatpak.nix
    ./printing.nix
  ];

  services.blueman.enable = true;
  services.libinput.enable = true;
}
