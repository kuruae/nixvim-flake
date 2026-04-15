{ ... }:
{
  programs.nixvim = {

    # ─── Basic options ─────────────────────────────────────────────────────────
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      smartindent = true;
      wrap = false;
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
    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
    };

    # ─── Globals ───────────────────────────────────────────────────────────────
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
  };
}
