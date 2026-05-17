{ ... }:
{
  plugins.markview = {
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
}
