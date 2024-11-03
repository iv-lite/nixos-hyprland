{ inputs
, config
, pkgs
, ...
}:
{
  home.file = {
    "${config.xdg.configHome}/hypr" = {
      source = ./.config/hypr;
      recursive = true;
    };

    "${config.xdg.configHome}/foot" = {
      source = ./.config/foot;
      recursive = true;
    };


    "${config.xdg.configHome}/mako" = {
      source = ./.config/mako;
      recursive = true;
    };

    "${config.xdg.configHome}/tofi" = {
      source = ./.config/tofi;
      recursive = true;
    };

    "${config.xdg.configHome}/waybar" = {
      source = ./.config/waybar;
      recursive = true;
    };

    "${config.xdg.configHome}/wlogout" = {
      source = ./.config/wlogout;
      recursive = true;
    };

    "${config.xdg.configHome}/xdg-desktop-portal" = {
      source = ./.config/xdg-desktop-portal;
      recursive = true;
    };
  };
}
