{ 
  inputs,
  config, 
  pkgs,
  hyprland,
  ... 
}: 

{
  
  imports = [
    ./packages
    # ./themes/configuration.nix
    ../hyprland
  ];

  
   # TODO please change the username & home direcotry to your own
  home.username = "iv";
  home.homeDirectory = "/home/iv";
  home.enableNixpkgsReleaseCheck = false;

  # set cursor size and dpi for 4k monitor
  # xresources.properties = {
  #   "Xcursor.size" = 16;
  #   "Xft.dpi" = 172;
  # };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";
# Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
