{ inputs, pkgs, ... }:
{
  imports = [
    ./options.nix
    ./keybinds.nix
    ./plugins.nix
    ./lua.nix
  ];

  extraPackages = with pkgs; [
    # Formatters
    rustfmt
    black
    isort
    clang-tools
    stylua
    nixfmt

    # Linters
    clippy
    ruff
    cppcheck

    xclip

    # Tools
    ripgrep
    fd
    pokeget-rs
  ];

  extraPlugins = with pkgs.vimPlugins; [
    conform-nvim
  ];
}
