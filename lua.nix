{ ... }:
{
  extraConfigLua = ''
    -- ── Clipboard ─────────────────────────────────────────────────────────
    vim.opt.clipboard = "unnamedplus"

    -- ── Yank highlights ───────────────────────────────────────────────────
    vim.api.nvim_create_autocmd('TextYankPost', {
        desc = 'Highlight when yanking (copying) text',
        callback = function()
          vim.highlight.on_yank({
          higroup = "IncSearch",
          timeout = 150,
          on_large_yank = false
        })
        end,
      })

    -- ── Auto create dir ──────────────────────────────────────────────────
    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      callback = function(event)
      if event.match:match("^%w%w+:[\\/][\\/]") then return end
      local file = vim.uv.fs_realpath(event.match) or event.match
      vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
    })

    -- ── Conform (format on save) ──────────────────────────────────────────
    require("conform").setup({
      formatters_by_ft = {
        rust    = { "rustfmt" },
        python  = { "isort", "black" },
        c       = { "clang_format" },
        cpp     = { "clang_format" },
        lua     = { "stylua" },
        nix     = { "nixfmt" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })

    -- ── which-key labels ────────────────────────────────────────────────────
    require("which-key").add({
      { "<leader>f", group = "Search" },
      { "<leader>g", group = "Git" },
    })

    -- ── Diagnostic signs and display ────────────────────────────────────────
    vim.diagnostic.config({
      virtual_text   = {
        spacing = 4,
        prefix = "●",
        format = function(diag)
          local msg = diag.message
          return #msg > 60 and msg:sub(1, 57) .. "…" or msg
        end,
      },
      signs          = true,
      underline      = true,
      update_in_insert = false,
      severity_sort  = true,
      float = {
        border = "rounded",
        source = "always",
      },
    })

    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        vim.api.nvim_set_hl(0, "SnacksIndent",      { fg = "#313244" })
        vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#45475a" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#cdd6f4", bold = true })
        vim.api.nvim_set_hl(0, "LineNr",       { fg = "#45475a" })
        vim.api.nvim_set_hl(0, "FlashLabel",       { bg = "#ff007c", fg = "#ffffff", bold = true })
        vim.api.nvim_set_hl(0, "FlashMatch",       { bg = "#1e2030", fg = "#7dcfff" })
        vim.api.nvim_set_hl(0, "FlashBackdrop",    { fg = "#545c7e" })
        vim.api.nvim_set_hl(0, "FlashTreesitter",  { bg = "#ff007c", fg = "#ffffff", bold = true })
        vim.api.nvim_set_hl(0, "FlashCursor",      { bg = "#ff007c", fg = "#ffffff" })
      end,
    })

  '';
}
