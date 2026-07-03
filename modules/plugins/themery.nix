{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    kanagawa-nvim
    rose-pine-nvim
  ];

  plugins.themery = {
    enable = true;
    settings = {
      livePreview = true;
      themes = [
        {
          name = "Catppuccin Mocha";
          colorscheme = "catppuccin";
          before.__raw = ''
            function()
              vim.g.catppuccin_flavour = "mocha"
            end
          '';
        }
        {
          name = "Catppuccin Latte";
          colorscheme = "catppuccin";
          before.__raw = ''
            function()
              vim.g.catppuccin_flavour = "latte"
            end
          '';
        }
        {
          name = "Catppuccin Frappe";
          colorscheme = "catppuccin";
          before.__raw = ''
            function()
              vim.g.catppuccin_flavour = "frappe"
            end
          '';
        }
        {
          name = "Catppuccin Macchiato";
          colorscheme = "catppuccin";
          before.__raw = ''
            function()
              vim.g.catppuccin_flavour = "macchiato"
            end
          '';
        }
        {
          name = "Kanagawa";
          colorscheme = "kanagawa";
        }
        {
          name = "Kanagawa Lotus";
          colorscheme = "kanagawa";
          before.__raw = ''
            function()
              vim.g.kanagawa_background = "lotus"
            end
          '';
        }
        {
          name = "Vague";
          colorscheme = "vague";
        }
        {
          name = "Kanso";
          colorscheme = "kanso";
        }
        {
          name = "Rose Pine";
          colorscheme = "rose-pine";
        }
        {
          name = "Rose Pine Moon";
          colorscheme = "rose-pine";
          before.__raw = ''
            function()
              vim.g.rose_pine_variant = "moon"
            end
          '';
        }
        {
          name = "Rose Pine Dawn";
          colorscheme = "rose-pine";
          before.__raw = ''
            function()
              vim.g.rose_pine_variant = "dawn"
            end
          '';
        }
        {
          name = "Oxocarbon";
          colorscheme = "oxocarbon";
        }
      ];
    };
  };
}
