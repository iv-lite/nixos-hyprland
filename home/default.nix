{ inputs
, config
, pkgs
, home-manager
, ...
}:

{

  imports = [
    home-manager.nixosModules.home-manager
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.iv = {
    imports = [
      ./softwares
      ./hyprland.nix
      ./themes
    ];

    # TODO please change the username & home direcotry to your own
    home.username = "iv";
    home.homeDirectory = "/home/iv";
    home.enableNixpkgsReleaseCheck = false;
    home.stateVersion = "24.05";
    programs.home-manager.enable = true;
  };

  home-manager.extraSpecialArgs = {
    inherit inputs;
  };
}
