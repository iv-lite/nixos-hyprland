{ config, pkgs, ...}:

{

    home.file = {
        "${config.xdg.configHome}/rofi/themes" = {
            source = ../../resources/.config/rofi/themes;
            recursive = true;
        };
    };

    programs.rofi = {
        enable = true;
        cycle = true;
        terminal = "${pkgs.ghostty}/bin/ghostty";
        plugins = [
          pkgs.rofi-calc
          pkgs.rofi-emoji
          pkgs.rofi-systemd
        ];

        extraConfig = {
          show-icons = true;
          kb-cancel = "Escape,Super+space";
          modi = "combi,window,run,drun,ssh,filebrowser,calc,emoji";
          sort = true;

          line-margin =10;

          display-ssh =   "";
          display-run =   "";
          display-drun =  "";
          display-window ="";
          display-combi = "";
        };

        theme = "nord";
    };
}