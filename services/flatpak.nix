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
    overrides = {
      global = {
        # Force Wayland by default
        Context.sockets = [
          "wayland"
          "!x11"
          "!fallback-x11"
        ];

        Environment = {
          # Fix un-themed cursor in some Wayland apps
          XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";

          # Force correct theme for some GTK apps
          GTK_THEME = "Arc-Dark";

          ELECTRON_OZONE_PLATFORM_HINT = "auto";
        };
      };
    };
  };
}
