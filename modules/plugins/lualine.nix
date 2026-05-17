{ ... }:
{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        theme = "auto";
        globalstatus = true;
        disabled_filetypes = {
          statusline = [
            "dashboard"
            "snacks_dashboard"
          ];
        };
        component_separators = {
          left = "";
          right = "";
        };
        section_separators = {
          left = "";
          right = "";
        };
      };
      sections = {
        lualine_a = {
          __raw = ''
            {
              { "mode", fmt = function(str) return str:sub(1,1) end },
            }
          '';
        };
        lualine_b = {
          __raw = ''
            {
              { "branch", icon = " " },
              { "diff", symbols = { added = " ", modified = " ", removed = " " } },
            }
          '';
        };
        lualine_c = {
          __raw = ''
            {
              { "filename" },
              { "diagnostics", sources = { "nvim_lsp" }, symbols = { error = " ", warn = " ", info = " ", hint = "󰝶 " } },
              { function() return "%=" end },
              {
                function()
                  local reg = vim.fn.reg_recording()
                  if reg ~= "" then return "  @" .. reg end
                  return ""
                end,
                color = { fg = "#f38ba8", bold = true }
              },
            }
          '';
        };
        lualine_x = {
          __raw = ''
            {
              {
                function()
                  return require("noice").api.status.command.get()
                end,
                cond = function()
                  return package.loaded["noice"] and require("noice").api.status.command.has()
                end,
                color = { fg = "#f5c2e7" }
              },
              { "filetype", icon_only = true },
            }
          '';
        };
        lualine_y = {
          __raw = ''
            {
              { "progress" },
            }
          '';
        };
        lualine_z = {
          __raw = ''
            {
              { "location" },
            }
          '';
        };
      };
      inactive_sections = {
        lualine_a = [ ];
        lualine_b = [ ];
        lualine_c = {
          __raw = ''
            {
              { "filename" },
            }
          '';
        };
        lualine_x = {
          __raw = ''
            {
              { "location" },
            }
          '';
        };
        lualine_y = [ ];
        lualine_z = [ ];
      };
    };
  };
}
