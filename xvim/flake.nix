{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    devshell.url = "github:numtide/devshell";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    devshell,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          config = {allowUnfree = true;};
        };

        config = pkgs.callPackage ./nix/config.nix {};

        plugins = pkgs.callPackage ./nix/plugins.nix {};

        nvim = pkgs.callPackage ./nix/wrapper.nix {
          appName = "nvim";
          configPath = "${config}";
          runtimePaths =
            [
              pkgs.vimPlugins.lazy-nvim
            ]
            ++ plugins.runtimePaths;
          extraVars = plugins.extraVars;
        };
      in {
        formatter = pkgs.alejandra;
        packages.default = nvim;

        devShells.default = pkgs.devshell.mkShell {
          imports = [
            "${devshell}/extra/git/hooks.nix"
            (pkgs.devshell.importTOML ./devshell.toml)
          ];
        };
      }
    );
}
