{
  config,
  pkgs,
  ...
}:
{
  services.flatpak = {
    enable = true;
    packages = [
      "com.discordapp.Discord"
    ];
  };
}
