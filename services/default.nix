{ config
, pkgs
, ...
}: {
  imports = [
    ./greetd/greetd.nix
  ];

  services.solaar = {
    enable = true; # Enable the service
    package = pkgs.solaar; # The package to use
    window = "hide"; # Show the window on startup (show, *hide*, only [window only])
    batteryIcons = "symbolic"; # Which battery icons to use (*regular*, symbolic, solaar)
    extraArgs = ""; # Extra arguments to pass to solaar on startup
  };

  services.udev = {
    enable = true;
    extraRules = ''
      KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
    '';
  };
}
