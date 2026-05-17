{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    rustfmt
    black
    isort
    clang-tools
    stylua
    nixfmt
    clippy
    ruff
    cppcheck
    xclip
    ripgrep
    fd
    pokeget-rs
  ];

  extraPlugins = with pkgs.vimPlugins; [
    conform-nvim
  ];
}
