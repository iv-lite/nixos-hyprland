{ config
, pkgs
, ...
}: {
  imports = [
    ./greetd.nix
    ./printing.nix
  ];

  services.blueman.enable = true;
  services.libinput.enable = true;
}
