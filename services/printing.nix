{ config
, pkgs
, ...
}:
{
  services.printing = {
    enable = true;
    drivers = [
      pkgs.hplip
    ];
  };
  programs.system-config-printer.enable = true;
}
