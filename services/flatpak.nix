{
  config,
  pkgs,
  ...
}:
{
  services.flatpak = {
    enable = true;
    update.onActivation = true;
    packages = [
      {
        appId = "com.discordapp.Discord";
        origin = "flathub";
      }
    ];
  };
}
