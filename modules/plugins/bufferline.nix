{ ... }:
{
  plugins.bufferline = {
    enable = true;
    settings = {
      highlights =
        let
          base = "#1e2030";
          accent = "#89b4fa";
          subtle = "#45475a";
          text = "#cdd6f4";
        in
        {
          fill = {
            bg = "NONE";
          };
          background = {
            bg = "NONE";
            fg = subtle;
          };
          buffer_selected = {
            bg = "NONE";
            fg = text;
            bold = true;
            underline = true;
            sp = accent;
          };
          buffer_visible = {
            bg = "NONE";
            fg = subtle;
          };
          modified = {
            bg = "NONE";
            fg = subtle;
          };
          modified_selected = {
            bg = "NONE";
            fg = accent;
            underline = true;
            sp = accent;
          };
          modified_visible = {
            bg = "NONE";
            fg = subtle;
          };
          separator = {
            bg = "NONE";
            fg = base;
          };
          separator_selected = {
            bg = "NONE";
            fg = base;
          };
          separator_visible = {
            bg = "NONE";
            fg = base;
          };
          indicator_selected = {
            fg = accent;
            bg = "NONE";
          };
          tab_selected = {
            bg = "NONE";
            bold = true;
          };
          tab = {
            bg = "NONE";
            fg = subtle;
          };
          tab_separator = {
            bg = "NONE";
            fg = base;
          };
          offset_separator = {
            bg = "NONE";
            fg = base;
          };
        };
      options = {
        always_show_bufferline = false;
        separator_style = "none";
        indicator.style = "underline";
        diagnostics = false;
        show_close_icon = false;
        show_buffer_close_icons = false;
        show_tab_indicators = false;
        persist_buffer_sort = true;
        max_name_length = 18;
        tab_size = 14;
        modified_icon = "●";
        left_trunc_marker = "";
        right_trunc_marker = "";
        numbers = "none";
        sort_by = "id";
        offsets = [
          {
            filetype = "oil";
            text = "Files";
            highlight = "Directory";
            text_align = "left";
          }
        ];
        groups = {
          options.toggle_hidden_on_enter = true;
          items = [
            {
              name = "Tests";
              highlight = {
                fg = "#a6da95";
              };
              priority = 1;
              matcher.__raw = ''
                function(buf)
                  return buf.name:match('%test')
                    or buf.name:match('%.spec')
                end
              '';
            }
          ];
        };
      };
    };
  };
}
