{ ... }:
{
  plugins.flash = {
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
}
