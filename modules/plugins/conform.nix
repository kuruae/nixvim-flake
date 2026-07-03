{ ... }:
{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        rust    = [ "rustfmt" ];
        python  = [ "isort" "black" ];
        c       = [ "clang_format" ];
        cpp     = [ "clang_format" ];
        lua     = [ "stylua" ];
        nix     = [ "nixfmt" ];
      };
      format_on_save = {
        timeout_ms = 500;
        lsp_fallback = true;
      };
    };
  };
}
