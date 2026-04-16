{
  description = "Modular Nixvim - Stable Manual Approach";

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
          # 1. Define the Nixvim helper for this specific system
          nixvim' = nixvim.legacyPackages.${system};

          # 2. Wrap your config in the expected module format
          nixvimModule = {
            inherit pkgs;
            module = import ./default.nix; # This points to your main config file
            extraSpecialArgs = { inherit inputs; }; # Pass flake inputs to your config
          };

          # 3. Create the actual Neovim package
          nvim = nixvim'.makeNixvimWithModule nixvimModule;
        in
        {
          # This is what 'nix run' and 'nix build' will use
          packages.default = nvim;

          # This allows 'nix flake check' to verify your config
          checks.default = nixvim.lib.${system}.check.mkTestDerivationFromNixvimModule nixvimModule;
        };

      # Export the module so you can use it in your NixOS/Home Manager config later
      flake.nixvimModules.default = import ./default.nix;
    };
}
