{
  description = "My NixOS + Home Manager (WSL) config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xvim = {
      url = "./xvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixos-wsl,
    ...
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
    vars = import ./vars.nix;
  in {
    homeConfigurations = {
      ${vars.os_user} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          inherit inputs outputs system vars;
        };
        modules = [./home];
      };
    };

    nixosConfigurations.${vars.system_name} = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit vars;};
      modules = [
        # Enable WSL support
        nixos-wsl.nixosModules.wsl
        # Main system config
        ./os/configuration.nix

        # Enable flakes, unfree, and Home Manager integration
        {
          nix.settings.experimental-features = ["nix-command" "flakes"];
          nixpkgs.config.allowUnfree = true;
        }
      ];
    };
  };
}
