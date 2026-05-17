{ ... }:
{
  plugins.mini = {
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
      ai = { };
      icons = { };
      comment = { };
      bufremove = { };
    };
  };
}
