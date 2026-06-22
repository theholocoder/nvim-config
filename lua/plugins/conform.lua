--[[
-- Lightweight yet powerful formatter plugin for Neovim
--]]
vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
  formatters_by_ft = {
    -- These formatter still need to be installed. See :Mason
    lua = { "lua-format" }, -- keep default
    javascript = { "biome", "prettier" },
    typescript = { "biome", "prettier" },
    php = { "php" },
    json = { "prettier" },
    jsonc = { "prettier" },
    -- html = { "prettier" },
    css = { "prettier" },
    -- yaml = { "prettier" },
    -- markdown = { "prettier" },
  }, -- Set default options
  default_format_opts = {
    lsp_format = "fallback",
  },
  format_on_save = {
    timeout_ms = 2500,
    lsp_format = "fallback",
  },
  formatters = {
    php = {
      command = "php-cs-fixer",
      args = {
        "fix",
        "$FILENAME",
        "--rules=@Symfony",
        "--allow-risky=yes", -- if you have risky stuff in config, if not you dont need it.
      },
      stdin = false,
    }
  }
})

vim.keymap.set("n", "<leader>f", function() require("conform").format({ async = true, lsp_fallback = true }) end,
  { desc = "Format buffer" })
