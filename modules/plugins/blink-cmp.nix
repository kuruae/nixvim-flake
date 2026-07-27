{ pkgs, lib, ... }:
{
  plugins.blink-cmp = {
    enable = true;

    settings = {
      appearance = {
        use_nvim_cmp_as_default = false;
        nerd_font_variant = "mono";
      };

      keymap = {
        preset = "default";

        "<Tab>" = [
          "select_next"
          "snippet_forward"
          "fallback"
        ];
        "<S-Tab>" = [
          "select_prev"
          "snippet_backward"
          "fallback"
        ];
        "<CR>" = [
          "accept"
          "fallback"
        ];
        "<C-y>" = [ "select_and_accept" ];
      };

      completion = {
        list = {
          selection = {
            preselect = false;
            auto_insert = true;
          };
        };
        accept = {
          auto_brackets = {
            enabled = true;
          };
        };

        keyword = {
          range = "prefix";
        };

        documentation = {
          auto_show = true;
          auto_show_delay_ms = 150;
        };

        ghost_text = {
          enabled = false;
        };

        menu = {
          draw = {
            treesitter = [ "lsp" ];
          };
        };
      };

      signature = {
        enabled = true;
        window = {
          border = "rounded";
        };
      };

      sources = {
        default = [
          "lsp"
          "path"
          "snippets"
          "buffer"
        ];
        providers = {
          lsp = {
            name = "LSP";
            module = "blink.cmp.sources.lsp";
            score_offset = 100; # Priority boost for clangd
          };
          buffer = {
            score_offset = -10; # Low priority for raw buffer words
          };
        };
      };

      cmdline = {
        enabled = true;
        sources = lib.nixvim.mkRaw ''
          function()
            local type = vim.fn.getcmdtype()
            if type == '/' or type == '?' then return { 'buffer' } end
            if type == ':' then return { 'cmdline', 'path' } end
            return {}
          end
        '';
      };
    };
  };
}
