{ config
, pkgs
, ...
}: {
  imports = [
    ./greetd
  ];

  # services.udev = {
  #   enable = true;
  #   extraRules = ''
  #     KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
  #   '';
  # };
}
