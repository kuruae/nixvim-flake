{ ... }:
{
  extraConfigLua = ''
    vim.opt.clipboard = "unnamedplus"

    vim.api.nvim_create_autocmd("TextYankPost", {
      callback = function()
        vim.highlight.on_yank({
          higroup = "IncSearch",
          timeout = 150,
          on_large_yank = false
        })
      end,
    })

    local function lsp_root(patterns)
      local found = vim.fs.find(patterns, { upward = true })
      if #found > 0 then
        return vim.fs.dirname(found[1])
      end
      local buf = vim.api.nvim_buf_get_name(0)
      if buf == "" then
        return vim.loop.cwd()
      end
      return vim.fs.dirname(buf)
    end

    local function lsp_start_if_available(opts)
      if vim.fn.executable(opts.cmd[1]) ~= 1 then return end
      local existing = vim.lsp.get_clients({ name = opts.name, bufnr = 0 })
      if #existing > 0 then return end
      local root = opts.root_dir or lsp_root(opts.root_patterns)
      vim.lsp.start({
        name = opts.name,
        cmd = opts.cmd,
        root_dir = root,
      })
    end

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local ft = vim.bo[args.buf].filetype
        if ft == "go" or ft == "gomod" then
          lsp_start_if_available({
            name = "gopls",
            cmd = { "gopls" },
            root_patterns = { "go.work", "go.mod", ".git" },
          })
        elseif ft == "zig" then
          lsp_start_if_available({
            name = "zls",
            cmd = { "zls" },
            root_patterns = { "build.zig", "build.zig.zon", ".git" },
          })
        elseif ft == "javascript" or ft == "javascriptreact" or ft == "typescript" or ft == "typescriptreact" then
          lsp_start_if_available({
            name = "tsserver",
            cmd = { "typescript-language-server", "--stdio" },
            root_patterns = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
          })
        elseif ft == "java" then
          lsp_start_if_available({
            name = "jdtls",
            cmd = { "jdtls" },
            root_patterns = { "gradlew", "mvnw", "pom.xml", "build.gradle", "build.gradle.kts", ".git" },
          })
        end
      end,
    })

    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      callback = function(event)
        if event.match:match("^%w%w+:[\\/][\\/]") then return end
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
      end,
    })

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

    require("which-key").add({
      { "<leader>f", group = "Search" },
      { "<leader>g", group = "Git" },
    })

    vim.diagnostic.config({
      virtual_text   = false,
      signs          = true,
      underline      = true,
      update_in_insert = false,
      severity_sort  = true,
      float = {
        border = "rounded",
        source = "always",
      },
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "fugitive", "fugitiveblame", "git" },
      callback = function(ev)
        local clients = vim.lsp.get_clients({ bufnr = ev.buf })
        for _, client in ipairs(clients) do
          vim.lsp.buf_detach_client(ev.buf, client.id)
        end
      end,
    })

    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        vim.diagnostic.open_float(nil, {
          focus = false,
          scope = "line",
          border = "rounded",
          source = "always",
        })
      end,
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
