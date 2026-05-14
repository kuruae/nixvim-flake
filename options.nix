{ ... }:
{

  # ─── Basic options ─────────────────────────────────────────────────────────
  opts = {
    number = true;
    relativenumber = true;
    shiftwidth = 2;
    tabstop = 2;
    expandtab = true;
    smartindent = true;
    wrap = true;
    ignorecase = true;
    smartcase = true;
    termguicolors = true;
    scrolloff = 8;
    signcolumn = "yes";
    updatetime = 250;
    timeoutlen = 300;
    splitright = true;
    splitbelow = true;
    cursorline = true;
    undofile = true;

    ttimeoutlen = 10;
    synmaxcol = 240;

    fillchars = {
      eob = " ";
    };
  };

  # ─── Colorscheme ───────────────────────────────────────────────────────────

  colorschemes = {
    catppuccin = {
      enable = true;
      settings = {
        background = {
          light = "mocha";
          dark = "mocha";
        };
        custom_highlights = ''
          function(highlights)
            return {
            CursorLineNr = { fg = highlights.peach, style = {} },
            NavicText = { fg = highlights.text },
            }
          end
        '';
        flavour = "mocha";
        no_bold = false;
        no_italic = false;
        no_underline = false;
        transparent_background = true;
        integrations = {
          cmp = true;
          notify = true;
          gitsigns = true;
          neotree = true;
          which_key = true;
          illuminate = {
            enabled = true;
            lsp = true;
          };
          treesitter = true;
          telescope.enabled = true;
          indent_blankline.enabled = true;
          mini = {
            enabled = true;
            indentscope_color = "rosewater";
          };
          native_lsp = {
            enabled = true;
            inlay_hints = {
              background = true;
            };
            virtual_text = {
              errors = [ "italic" ];
              hints = [ "italic" ];
              information = [ "italic" ];
              warnings = [ "italic" ];
              ok = [ "italic" ];
            };
            underlines = {
              errors = [ "underline" ];
              hints = [ "underline" ];
              information = [ "underline" ];
              warnings = [ "underline" ];
            };
          };
        };
      };
    };
  };

  # ─── Globals ───────────────────────────────────────────────────────────────
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };
}
