{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    leetcode-nvim
  ];

  plugins.leetcode = {
    enable = true;
  };
}
