{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./bash.nix
    ./git.nix
    ./direnv.nix
    ./rofi.nix
  ];

  home.packages = with pkgs; [
    neofetch

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    glow # markdown previewer in terminal
    rofimoji # emoji for rofi

    # media
    cider
    hyprshot

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  programs.waybar.enable = true;
}
