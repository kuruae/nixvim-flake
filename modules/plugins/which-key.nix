{ ... }:
{
  plugins.which-key = {
    enable = true;
    settings.spec.__raw = ''
      {
        { "<leader>f", group = "Search" },
        { "<leader>g", group = "Git" },
      }
    '';
  };
}
