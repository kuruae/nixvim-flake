{ ... }:
{

  # ─── Keymaps ───────────────────────────────────────────────────────────────
  keymaps = [
    # Save / quit
    {
      mode = "n";
      key = "<leader>w";
      action = "<cmd>w<cr>";
      options.desc = "Save";
    }
    {
      mode = "n";
      key = "<leader>q";
      action = "<cmd>q<cr>";
      options.desc = "Quit";
    }
    {
      mode = "n";
      key = "<leader>ww";
      action = "<cmd>wa<cr>";
      options.desc = "Save all";
    }
    {
      mode = "n";
      key = "<leader>Q";
      action = "<cmd>qa<cr>";
      options.desc = "Quit all";
    }
    {
      mode = "n";
      key = "<leader>W";
      action = "<cmd>wq<cr>";
      options.desc = "Save & quit";
    }

    # Window navigation (Ctrl+hjkl)
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options.desc = "Window left";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options.desc = "Window down";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options.desc = "Window up";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options.desc = "Window right";
    }

    # Spammable indenting
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options.desc = "repeating <";
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options.desc = "repeating >";
    }
    # Buffer navigation
    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>bprevious<cr>";
      options.desc = "Prev buffer";
    }
    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>bnext<cr>";
      options.desc = "Next buffer";
    }
    {
      mode = "n";
      key = "<leader>b";
      action = "<cmd>lua Snacks.bufdelete()<cr>";
      options.desc = "Delete buffer";
    }
    {
      mode = "n";
      key = "<leader>p";
      action = "<cmd>BufferLinePick<cr>";
      options.desc = "Pick buffer";
    }

    {
      # Move lines in visual mode (Alt+jk)
      mode = "v";
      key = "<A-j>";
      action = ":m '>+1<cr>gv=gv";
      options.desc = "Move line down";
    }
    {
      mode = "v";
      key = "<A-k>";
      action = ":m '<-2<cr>gv=gv";
      options.desc = "Move line up";
    }

    # Clear search highlight
    {
      mode = "n";
      key = "<leader>h";
      action = "<cmd>nohlsearch<cr>";
      options.desc = "Clear highlight";
    }
    {
      mode = "n";
      key = "<Esc><Esc>";
      action = "<cmd>nohlsearch<cr>";
      options.desc = "Clear highlight";
    }

    # Escape
    {
      mode = "i";
      key = "jk";
      action = "<Esc>";
      options.desc = "Escape";
    }
    {
      mode = "i";
      key = "kj";
      action = "<Esc>";
      options.desc = "Escape";
    }

    # re-center while scrolling / searching
    {
      mode = "n";
      key = "<C-d>";
      action = "<C-d>";
      options.desc = "Scroll down (centered)";
    }
    {
      mode = "n";
      key = "<C-u>";
      action = "<C-u>";
      options.desc = "Scroll up (centered)";
    }
    {
      mode = "n";
      key = "n";
      action = "nzzzv";
      options.desc = "Next result (centered)";
    }
    {
      mode = "n";
      key = "N";
      action = "Nzzzv";
      options.desc = "Prev result (centered)";
    }

    # File tree
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Oil --float<cr>";
      options.desc = "Toggle file tree (Oil)";
    }

    # Snacks picker
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>lua Snacks.picker.files()<cr>";
      options.desc = "Find files";
    }
    {
      mode = "n";
      key = "<leader>fF";
      action = "<cmd>lua Snacks.picker.files({ cmd = 'fd', args = { '--hidden', '--no-ignore' } })<cr>";
      options.desc = "Find files";
    }
    {
      mode = "n";
      key = "<leader>rg";
      action = "<cmd>lua Snacks.picker.grep()<cr>";
      options.desc = "Live grep";
    }
    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>lua Snacks.picker.grep({ cmd = 'fd', args = { '--hidden', '--no-ignore' } })<cr>";
      options.desc = "Live grep";
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>lua Snacks.picker.buffers()<cr>";
      options.desc = "Buffers";
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = "<cmd>lua Snacks.picker.help()<cr>";
      options.desc = "Help";
    }
    {
      mode = "n";
      key = "<leader>fr";
      action = "<cmd>lua Snacks.picker.recent()<cr>";
      options.desc = "Recent files";
    }
    {
      mode = "n";
      key = "<leader>fd";
      action = "<cmd>lua Snacks.picker.diagnostics()<cr>";
      options.desc = "Diagnostics";
    }
    {
      mode = "n";
      key = "<leader>fs";
      action = "<cmd>lua Snacks.picker.lsp_symbols()<cr>";
      options.desc = "LSP symbols";
    }
    {
      mode = "n";
      key = "<leader>fc";
      action = "<cmd>lua Snacks.picker.command_history()<cr>";
      options.desc = "Command history";
    }

    # LSP (also wired in plugins.lsp.keymaps below for buffer-local)
    {
      mode = "n";
      key = "<leader>ca";
      action = "<cmd>lua vim.lsp.buf.code_action()<cr>";
      options.desc = "Code action";
    }
    {
      mode = "n";
      key = "<leader>rn";
      action = "<cmd>lua vim.lsp.buf.rename()<cr>";
      options.desc = "Rename";
    }
    {
      mode = "n";
      key = "K";
      action = "<cmd>lua vim.lsp.buf.hover()<cr>";
      options.desc = "Hover docs";
    }

    # Diagnostics
    {
      mode = "n";
      key = "[d";
      action = "<cmd>lua vim.diagnostic.jump()<cr>";
      options.desc = "Prev diagnostic";
    }
    {
      mode = "n";
      key = "]d";
      action = "<cmd>lua vim.diagnostic.goto_next()<cr>";
      options.desc = "Next diagnostic";
    }

    # Gitsigns
    {
      mode = "n";
      key = "<leader>gp";
      action = "<cmd>Gitsigns preview_hunk<cr>";
      options.desc = "Preview hunk";
    }
    {
      mode = "n";
      key = "<leader>gb";
      action = "<cmd>Gitsigns blame_line<cr>";
      options.desc = "Blame line";
    }

    # flash jump
    {
      mode = [
        "n"
        "x"
        "o"
      ];
      key = "s";
      action.__raw = "function() require('flash').jump() end";
      options.desc = "Flash jump";
    }
    {
      mode = [
        "n"
        "x"
        "o"
      ];
      key = "S";
      action.__raw = "function() require('flash').treesitter() end";
      options.desc = "Flash treesitter";
    }
    {
      mode = "o";
      key = "r";
      action.__raw = "function() require('flash').remote() end";
      options.desc = "Flash remote";
    }
    {
      mode = [
        "x"
        "o"
      ];
      key = "R";
      action.__raw = "function() require('flash').treesitter_search() end";
      options.desc = "Flash treesitter search";
    }
    {
      mode = "c";
      key = "<C-s>";
      action.__raw = "function() require('flash').toggle() end";
      options.desc = "Toggle flash search";
    }
    # global rg search
    {
      mode = "n";
      key = "<leader>/";
      action.__raw = ''
        function()
          Snacks.picker.grep_buffers() 
        end
      '';
      options.desc = "Search in buffer";
    }
    # Toggle bufferline
    {
      mode = "n";
      key = "<leader>tb";
      action.__raw = ''
        function()
          if vim.opt.showtabline:get() == 2 then
            vim.opt.showtabline = 0
          else
            vim.opt.showtabline = 2
          end
        end
      '';
      options.desc = "Toggle bufferline";
    }
  ];
}
