{
  description = "Nixvim Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      nixvim,
      flake-parts,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        { system, pkgs, ... }:
        let
          nixvim' = nixvim.legacyPackages.${system};

          nixvimModule = {
            inherit pkgs;
            module = import ./default.nix;
            extraSpecialArgs = { inherit inputs; };
          };

          nvim = nixvim'.makeNixvimWithModule nixvimModule;
        in
        {
          packages.default = nvim;

          checks.default = nixvim.lib.${system}.check.mkTestDerivationFromNixvimModule nixvimModule;
        };

      flake.nixvimModules.default = import ./default.nix;
    };
}
