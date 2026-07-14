{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    leetcode-nvim
  ];

  extraConfigLua = ''
    require("leetcode").setup({
    })
  '';
}
