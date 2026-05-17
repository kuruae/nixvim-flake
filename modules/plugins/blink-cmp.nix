{ ... }:
{
  plugins.blink-cmp = {
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
}
