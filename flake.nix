{
  inputs = {
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    # hyprland = {
    #   type = "git";
    #   url = "https://github.com/hyprwm/Hyprland";
    #   submodules = true;
    # };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland"; # <- make sure this line is present for the plugin to work as intended
    };
  };

  outputs =
    inputs@{ nixpkgs
    , nixpkgs-unstable
    , home-manager
    , hyprland
    , ...
    }:
    let
      system = "x86_64-linux";
      # pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # Used with `nixos-rebuild --flake .#<hostname>`
      # nixosConfigurations."<hostname>".config.system.build.toplevel must be>
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit
              inputs
              nixpkgs-unstable
              home-manager
              ;
          };
          modules = [
            ./system/configuration.nix
            ./services
            ./hyprland/configuration.nix
            ./home
          ];
        };
      };
    };
}
