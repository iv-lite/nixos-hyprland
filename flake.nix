{
  inputs = {
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sddm-sugar-candy-nix = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
      # Optional, by default this flake follows nixpkgs-unstable.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.5.2";
  };

  outputs =
    inputs@{
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      hyprland,
      sddm-sugar-candy-nix,
      nix-flatpak,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      # Used with `nixos-rebuild --flake .#<hostname>`
      # nixosConfigurations."<hostname>".config.system.build.toplevel must be>
      nixosConfigurations = {
        nixos-z690 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit
              inputs
              nixpkgs-unstable
              home-manager
              ;
          };
          modules = [
            sddm-sugar-candy-nix.nixosModules.default
            nix-flatpak.nixosModules.nix-flatpak
            {
              nixpkgs = {
                overlays = [
                  sddm-sugar-candy-nix.overlays.default
                ];
              };
            }
            ./hosts/nixos-z690
            ./security
            ./services
            ./softwares
            ./fonts
            ./home
          ];
        };
      };
    };
}
