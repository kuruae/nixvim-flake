{ ... }:
{
  plugins.lsp = {
    enable = true;
    servers = {
      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
        settings = {
          cargo.allFeatures = true;
          checkOnSave.command = "clippy";
          procMacro.enable = true;
        };
      };
      pyright.enable = true;
      clangd = {
        enable = true;
        cmd = [
          "clangd"
          "--tweaks=-std=c++26"
        ];
        onAttach.function = ''
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        '';
      };
      lua_ls = {
        enable = true;
        settings.Lua = {
          runtime.version = "LuaJIT";
          diagnostics.globals = [ "vim" ];
        };
      };
      nixd.enable = true;
    };
    keymaps = {
      lspBuf = {
        "gd" = {
          action = "definition";
          desc = "Go to definition";
        };
        "gD" = {
          action = "declaration";
          desc = "Go to declaration";
        };
        "gi" = {
          action = "implementation";
          desc = "Go to implementation";
        };
        "gr" = {
          action = "references";
          desc = "References";
        };
        "<leader>D" = {
          action = "type_definition";
          desc = "Type definition";
        };
      };
      diagnostic = {
        "<leader>dl" = {
          action = "open_float";
          desc = "Diagnostic float";
        };
      };
    };
  };

  extraConfigLua = ''
    vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
      config = config or {}
      config.border = "rounded"
      vim.lsp.handlers.hover(err, result, ctx, config)
    end
    vim.lsp.handlers["textDocument/signatureHelp"] = function(err, result, ctx, config)
      config = config or {}
      config.border = "rounded"
      vim.lsp.handlers.signature_help(err, result, ctx, config)
    end
  '';
}
