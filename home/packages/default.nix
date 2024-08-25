{
    config,
    pkgs,
    ...
}: {
  imports = [
    ./sources/bash.nix
    ./sources/git.nix
    ./sources/direnv.nix
    ./sources/vscode.nix
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

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];
}
