{ inputs, pkgs, ... }:
{
  imports = [
    ./modules/core/options.nix
    ./modules/core/keymaps.nix
    ./modules/core/lua.nix
    ./modules/core/packages.nix

    ./modules/plugins/treesitter.nix
    ./modules/plugins/lsp.nix
    ./modules/plugins/blink-cmp.nix
    ./modules/plugins/luasnip.nix
    ./modules/plugins/snacks.nix
    ./modules/plugins/noice.nix
    ./modules/plugins/bufferline.nix
    ./modules/plugins/lualine.nix
    ./modules/plugins/gitsigns.nix
    ./modules/plugins/markview.nix
    ./modules/plugins/flash.nix
    ./modules/plugins/oil.nix
    ./modules/plugins/mini.nix
    ./modules/plugins/which-key.nix
    ./modules/plugins/qol.nix
    ./modules/plugins/conform.nix
  ];
}
