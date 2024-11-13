{ config
, pkgs
, ...
}: {
  imports = [
    ./greetd.nix
  ];

  services.blueman.enable = true;
  services.libinput.enable = true;
}
