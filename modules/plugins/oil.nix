{ ... }:
{
  plugins.oil = {
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
}
