{ pkgs, ... }:
{

  plugins = {

    # ── Treesitter ─────────────────────────────────────────────────────────
    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
        ensure_installed = [ ];
      };
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        c
        cpp
        lua
        nix
        python
        rust
        json
        yaml
        toml
        markdown
        markdown_inline
        vim
        vimdoc
        regex
      ];
    };

    # shows current scope at top of screen, but renders as ugly boxes idk why
    # treesitter-context.enable = true;

    # ── LSP ────────────────────────────────────────────────────────────────
    lsp = {
      enable = true;
      servers = {

        # Rust
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
          settings = {
            cargo.allFeatures = true;
            checkOnSave.command = "clippy";
            procMacro.enable = true;
          };
        };

        # Python
        pyright.enable = true;

        # C / C++
        clangd.enable = true;

        # Lua
        lua_ls = {
          enable = true;
          settings.Lua = {
            runtime.version = "LuaJIT";
            diagnostics.globals = [ "vim" ];
          };
        };

        # Nix
        nixd.enable = true;
      };

      # Buffer local LSP keymaps (only active when an LSP attaches)
      keymaps = {
        lspBuf = {
          "gd" = {
            action = "definition";
            desc = "Go to definition";
          };
          "gD" = {
            action = "declaration";
            desc = "Go to declaration";
          };
          "gi" = {
            action = "implementation";
            desc = "Go to implementation";
          };
          "gr" = {
            action = "references";
            desc = "References";
          };
          "<leader>D" = {
            action = "type_definition";
            desc = "Type definition";
          };
        };
        diagnostic = {
          "<leader>dl" = {
            action = "open_float";
            desc = "Diagnostic float";
          };
        };
      };
    };

    # Completion
    cmp = {
      enable = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "buffer"; }
          { name = "path"; }
        ];
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.abort()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i','s'})";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i','s'})";
          "<C-d>" = "cmp.mapping.scroll_docs(4)";
          "<C-u>" = "cmp.mapping.scroll_docs(-4)";
        };
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
      };
    };

    # Snippet engine (needed by cmp)
    luasnip.enable = true;
    cmp_luasnip.enable = true;

    # ── Snacks ─────────────────────────────────────────────────────────────
    snacks = {
      enable = true;
      settings = {

        dashboard = {
          enable = true;
          width = 50;
          sections = [
            {
              section = "terminal";
              cmd = "${pkgs.writeShellScript "pokevim" (builtins.readFile ./pokevim.sh)} ; sleep infinity";
              padding = 1;
              indent = 1;
              height = 14;
              align = "center";
              ttl = 1200;
            }
            {
              section = "keys";
              title = "Quick Links";
              items = [
                {
                  key = "f";
                  desc = "Find File";
                  action = ":lua Snacks.picker.files()";
                }
                {
                  key = "n";
                  desc = "New File";
                  action = ":ene | startinsert";
                }
                {
                  key = "q";
                  desc = "Quit";
                  action = ":qa";
                }
              ];
            }
          ];
        };

        picker = {
          enabled = true;
          ui_select = true;
        };

        indent = {
          enabled = true;
          animate.enabled = false;
          scope.enabled = false;
        };

        # Notifications — replaces fidget, shows LSP progress + vim.notify
        notifier = {
          enabled = true;
          timeout = 3000; # ms before auto-dismiss
          style = "compact";
        };

        words.enabled = true;

        statuscolumn.enabled = true;

        # Best setting:
        # SSH -- OFF
        # Local -- ON
        scroll.enabled = false;

        terminal.enabled = false;
        zen.enabled = false;
      };
    };

    # ── Noice ──────────────────────────────────────────────────────────────
    noice = {
      enable = true;
      settings = {
        lsp.override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
          "cmp.entry.get_documentation" = true;
        };
        presets = {
          bottom_search = true;
          command_palette = true;
          long_message_to_split = true;
        };
      };
    };

    # ── File tree ──────────────────────────────────────────────────────────
    neo-tree = {
      enable = true;
      settings = {
        window.width = 30;
        filesystem = {
          filtered_items = {
            visible = true; # show hidden but greyed out
            hide_gitignored = false;
          };
          follow_current_file.enabled = true;
        };
      };
    };

    # ── Bufferline ──────────────────────────────────────────────────────────
    bufferline = {
      enable = true;
      settings.options = {
        separator_style = "thin";
        show_buffer_close_icons = false;
        show_close_icon = false;
      };
    };

    # ── Status line ────────────────────────────────────────────────────────
    lualine = {
      enable = true;
      settings.options = {
        theme = "auto";
        globalstatus = true;
        componentSeparators = {
          left = "|";
          right = "|";
        };
        sectionSeparators = {
          left = "";
          right = "";
        };
      };
    };

    # ── Git ────────────────────────────────────────────────────────────────
    gitsigns = {
      enable = true;
      settings = {
        signs = {
          add.text = "▎";
          change.text = "▎";
          delete.text = "_";
          topdelete.text = "‾";
          changedelete.text = "~";
        };
        current_line_blame = false; # toggle with <leader>gb
      };
    };

    # ── Markview ──────────────────────────────────────────────────────────
    markview = {
      enable = true;
      settings = {

        preview = {
          enable = true;
          modes = [
            "n"
            "c"
          ];
          hybrid_modes = [ "n" ];
          filetypes = [
            "markdown"
            "latex"
          ];
        };

        markdown = {
          headings = {
            heading_1 = {
              style = "label";
            };
            heading_2 = {
              style = "label";
            };
            heading_3 = {
              style = "label";
            };
          };
          code_blocks = {
            style = "block";
            pad_char = " ";
            pad_amount = 2;
          };
          horizontal_rules.enable = true;
          list_items = {
            marker_minus = {
              add_padding = true;
            };
            marker_plus = {
              add_padding = true;
            };
            marker_star = {
              add_padding = true;
            };
          };
          tables.enable = true;
        };

        markdown_inline = {
          inline_codes.enable = true;
          checkboxes.enable = true;
        };

        latex = {
          blocks.enable = true;
          inlines.enable = true;
          symbols.enable = true;
          subscripts.enable = true;
          superscripts.enable = true;
          commands.enable = true;
          parenthesis.enable = true;
        };
      };
    };

    # ── Flash ──────────────────────────────────────────────────────────────
    flash = {
      enable = true;
      settings = {
        labels = "asdfghjklqwertyuiopzxcvbnm";
        search = {
          multi_window = true;
          forward = true;
          wrap = true;
        };
        jump.autojump = false;
        label = {
          style = "overlay";
          uppercase = false;
        };
        modes = {
          search = {
            enabled = false;
          };
          char = {
            enabled = true;
          };
          treesitter = {
            labels = "asdfghjklqwertyuiopzxcvbnm";
            jump.pos = "range";
            label.before = true;
            label.after = true;
            label.style = "inline";
            highlight.backdrop = false;
          };
        };
      };
    };

    # ── Mini ──────────────────────────────────────────────────────────────
    mini = {

      enable = true;
      mockDevIcons = true;

      modules = {
        surround = {
          mappings = {
            add = "ys";
            delete = "ds";
            replace = "cs";
            find = "gsf";
            find_left = "gsF";
            highlight = "gsh";
            update_n_lines = "gsn";
          };
        };
        ai = { }; # mey, this isnt what you think
        icons = { };
        comment = { };
      };
    };

    # ── QoL ────────────────────────────────────────────────────────────────

    # Indentation guide lines
    indent-blankline.enable = false;

    # Show pending keybind completions
    which-key.enable = true;

    # Highlight TODO/FIXME/HACK/NOTE comments
    todo-comments.enable = true;

    # Pretty diagnostics list  (<leader>xx to open)
    trouble.enable = true;
  };
}
