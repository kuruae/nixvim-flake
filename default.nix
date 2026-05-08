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
    stylua
    nixfmt

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
