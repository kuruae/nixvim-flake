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
          package = null;
          installCargo = false;
          installRustc = false;
          settings = {
            cargo.allFeatures = true;
            checkOnSave.command = "clippy";
            procMacro.enable = true;
          };
        };

        # Python
        basedpyright = {
          enable = true;
          package = null;
        };

        # C / C++
        clangd = {
          enable = true;
          package = null;
          onAttach.function = ''
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          '';
        };

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

    # ── Completion ─────────────────────────────────────────────────────────
    blink-cmp = {
      enable = true;
      settings = {
        keymap = {
          preset = "default";
          "<Tab>" = [
            "accept"
            "fallback"
          ];
          "<S-Tab>" = [
            "select_next"
            "fallback"
          ];
          "<CR>" = [
            "accept"
            "fallback"
          ];
          "<C-e>" = [
            "cancel"
            "fallback"
          ];
          "<C-Space>" = [
            "show"
            "fallback"
          ];
          "<C-d>" = [
            "scroll_documentation_down"
            "fallback"
          ];
          "<C-u>" = [
            "scroll_documentation_up"
            "fallback"
          ];
        };
        appearance.nerd_font_variant = "mono";
        completion = {
          list = {
            selection = {
              preselect = true;
              auto_insert = false;
            };
          };
          documentation = {
            auto_show = true;
            auto_show_delay_ms = 150;
          };
          menu.draw.treesitter = [ "lsp" ];
        };
        sources.default = [
          "lsp"
          "path"
          "snippets"
          "buffer"
        ];
        snippets.preset = "luasnip";
      };
    };

    # Snippet engine (needed by cmp)
    luasnip.enable = true;
    # cmp_luasnip.enable = true;

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
              padding = 4;
              indent = 1;
              height = 16;
              align = "center";
              ttl = 1200;
            }
            {
              section = "keys";
              title = " ";
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

        notifier = {
          enabled = true;
          timeout = 3000; # ms
          style = "compact";
          filter.__raw = ''
            function(notif)
              if notif.title == "pyright" then return false end
              return true
            end
          '';
        };

        words.enabled = true;

        statuscolumn.enabled = true;

        # Best setting:
        # SSH -- OFF
        # Local -- ON
        scroll.enabled = true;

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

    # ── Bufferline ──────────────────────────────────────────────────────────
    bufferline = {
      enable = true;
      settings = {
        highlights =
          let
            commonBgColor = "#363a4f";
            commonFgColor = "#1e2030";

            commonSelectedAttrs = {
              bg = commonBgColor;
            };

            # Define a set with common selected attributes
            selectedAttrsSet = builtins.listToAttrs (
              map
                (name: {
                  inherit name;
                  value = commonSelectedAttrs;
                })
                [
                  # "separator_selected" # Handled uniquely
                  "buffer_selected"
                  "tab_selected"
                  "numbers_selected"
                  "close_button_selected"
                  "duplicate_selected"
                  "modified_selected"
                  "info_selected"
                  "warning_selected"
                  "error_selected"
                  "hint_selected"
                  "diagnostic_selected"
                  "info_diagnostic_selected"
                  "warning_diagnostic_selected"
                  "error_diagnostic_selected"
                  "hint_diagnostic_selected"
                ]
            );
          in
          # Merge the common selected attributes with the unique attributes
          selectedAttrsSet
          // {
            fill = {
              bg = commonFgColor;
            };
            separator = {
              fg = commonFgColor;
            };
            separator_visible = {
              fg = commonFgColor;
            };
            separator_selected = {
              bg = commonBgColor;
              fg = commonFgColor;
            };
          };

        options = {
          numbers = "ordinal";
          diagnostics = "nvim_lsp";
          diagnostics_indicator = /* Lua */ ''
            function(count, level, diagnostics_dict, context)
              local s = ""
              for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " "
                  or (e == "warning" and " " or "" )
                if(sym ~= "") then
                  s = s .. " " .. n .. sym
                end
              end
              return s
            end
          '';
          # Will make sure all names in bufferline are unique
          enforce_regular_tabs = false;

          offsets = [
            {
              filetype = "neo-tree";
              text = "Neo-tree";
              highlight = "Directory";
              text_align = "left";
            }
          ];

          groups = {
            options = {
              toggle_hidden_on_enter = true;
            };

            items = [
              {
                name = "Tests";
                highlight = {
                  underline = true;
                  fg = "#a6da95";
                  sp = "#494d64";
                };
                priority = 2;
                # icon = "";
                matcher.__raw = ''
                  function(buf)
                    return buf.name:match('%test') or buf.name:match('%.spec')
                  end
                '';
              }
              {
                name = "Docs";
                highlight = {
                  undercurl = true;
                  fg = "#ffffff";
                  sp = "#494d64";
                };
                auto_close = false;
                matcher.__raw = ''
                  function(buf)
                    return buf.name:match('%.md') or buf.name:match('%.txt')
                  end
                '';
              }
            ];
          };

          left_trunc_marker = "";
          max_name_length = 18;
          max_prefix_length = 15;
          modified_icon = "●";

          always_show_bufferline = false;
          persist_buffer_sort = true;
          right_trunc_marker = "";
          separator_style = "thick";
          show_buffer_close_icons = true;
          show_buffer_icons = true;
          show_close_icon = true;
          show_tab_indicators = true;
          sort_by = "id";
          tab_size = 16;
        };
      };
    };
    # ── Status line ────────────────────────────────────────────────────────
    lualine = {
      enable = true;
      settings = {
        options = {
          theme = "auto";
          globalstatus = true;
          disabled_filetypes = {
            statusline = [
              "dashboard"
              "snacks_dashboard"
            ];
          };
          component_separators = {
            left = "";
            right = "";
          };
          section_separators = {
            left = "";
            right = "";
          };
        };
        sections = {
          lualine_a = [
            {
              name = "mode";
              fmt.__raw = "function(str) return str:sub(1,1) end";
            }
          ];
          lualine_b = [
            {
              name = "branch";
              icon = " ";
            }
            {
              name = "diff";
              symbols = {
                added = " ";
                modified = " ";
                removed = " ";
              };
            }
          ];
          lualine_c = [
            { name = "filename"; }
            {
              name = "diagnostics";
              sources = [ "nvim_lsp" ];
              symbols = {
                error = " ";
                warn = " ";
                info = " ";
                hint = "󰝶 ";
              };
            }
            { name.__raw = ''function() return "%=" end''; } # center spacer
            {
              name.__raw = ''
                function()
                  local reg = vim.fn.reg_recording()
                  if reg ~= "" then return "  @" .. reg end
                  return ""
                end
              '';
              color.__raw = ''{ fg = "#f38ba8", bold = true }'';
            }
          ];
          lualine_x = [
            {
              name = "filetype";
              icon_only = true;
            }
          ];
          lualine_y = [
            { name = "progress"; }
          ];
          lualine_z = [
            { name = "location"; }
          ];
        };
        inactive_sections = {
          lualine_a = [ ];
          lualine_b = [ ];
          lualine_c = [ { name = "filename"; } ];
          lualine_x = [ { name = "location"; } ];
          lualine_y = [ ];
          lualine_z = [ ];
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

    # ── Oil ───────────────────────────────────────────────────────────────
    oil = {
      enable = true;
      settings = {
        use_default_keymaps = true;
        view_options = {
          show_hidden = true;
          is_always_hidden_file.__raw = ''
            function(name)
              return name == ".." or name == ".git"
            end
          '';
        };
        float = {
          padding = 2;
          max_width = 80;
          max_height = 20;
          border = "rounded";
        };
        default_file_explorer = true;
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
        pairs = { };
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
