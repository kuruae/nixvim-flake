{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    themery-nvim
    kanagawa-nvim
    rose-pine
    oxocarbon-nvim
    vague-nvim
  ];

  extraConfigLua = ''
    require("themery").setup({
      livePreview = true,
      themes = {
        {
          name = "Catppuccin Mocha",
          colorscheme = "catppuccin-mocha",
        },
        {
          name = "Catppuccin Latte",
          colorscheme = "catppuccin-latte",
        },
        {
          name = "Catppuccin Frappe",
          colorscheme = "catppuccin-frappe",
        },
        {
          name = "Catppuccin Macchiato",
          colorscheme = "catppuccin-macchiato",
        },
        {
          name = "Kanagawa",
          colorscheme = "kanagawa",
        },
        {
          name = "Vague",
          colorscheme = "vague",
        },
        {
          name = "Rose Pine",
          colorscheme = "rose-pine-main",
        },
        {
          name = "Rose Pine Moon",
          colorscheme = "rose-pine-moon",
        },
        {
          name = "Rose Pine Dawn",
          colorscheme = "rose-pine-dawn",
        },
        {
          name = "Oxocarbon",
          colorscheme = "oxocarbon",
          before = [[
            vim.o.background = "dark"
          ]],
        },
        {
          name = "Oxocarbon Light",
          colorscheme = "oxocarbon",
          before = [[
            vim.o.background = "light"
          ]],
        },
      },
    })
  '';
}
