{
  description = "Nixvim config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixvim,
      flake-parts,
      ...
    }@inputs:
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
          nvim = nixvim.lib.${system}.makeNixvimWithModule {
            inherit pkgs;
            module = import ./default.nix;
            extraSpecialArgs = { inherit inputs; };
          };
        in
        {
          packages.default = nvim;
          packages.nvim = nvim;

          devShells.default = pkgs.mkShell {
            packages = [ nvim ];
          };
        };

      flake.homeModules.default = import ./default.nix;
    };
}
