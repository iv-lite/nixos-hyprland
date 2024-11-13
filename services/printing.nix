{ config
, pkgs
, ...
}:
{
  environment.systemPackages = with pkgs; [
    hplip
  ];
  services.printing = {
    enable = true;
    drivers = [
      pkgs.hplip
    ];
  };
  programs.system-config-printer.enable = true;
}
