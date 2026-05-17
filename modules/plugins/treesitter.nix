{ pkgs, ... }:
{
  plugins.treesitter = {
    enable = true;
    settings = {
      highlight.enable = true;
      indent.enable = true;
      ensure_installed = [ ];
    };
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      c
      cpp
      lua
      nix
      python
      rust
      json
      yaml
      toml
      markdown
      markdown_inline
      vim
      vimdoc
      regex
    ];
  };
}
