--[[
-- nvim-lspconfig is a "data only" repo, providing basic, default Nvim LSP client configurations for various LSP servers.
--]]
vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/antonk52/filepaths_ls.nvim",
})

require("mason").setup()

-- Capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())
vim.lsp.config("*", { capabilities = capabilities })

---------------------------------------------------------------------------------------------
--- Here, configure and enable each LSP
---------------------------------------------------------------------------------------------
-- we only need to .config if there are peculiar configurations, otherwise nvim-lspconfig will take care of it
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
})

vim.lsp.enable({
  "filepaths_ls",
  "lua_ls",
  "angularls",
  "biome",
  "prettier",
  "vtsls",
})
---------------------------------------------------------------------------------------------

-- Keybinding
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
-- vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, "Go to definition")
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format Local buffer" })

---------------------------------------------------------------------------------------------
-- Change diagnostic symbols in the sign column (gutter)
local signs = { ERROR = "", WARN = "", INFO = "", HINT = "" }
local diagnostic_signs = {}
for type, icon in pairs(signs) do
  diagnostic_signs[vim.diagnostic.severity[type]] = icon
end
vim.diagnostic.config({
  -- "virtual_lines" displays the error below the line in a fancy way
  virtual_lines = {
    current_line = true,
  },
  signs = { text = diagnostic_signs },
})

-- This function gets run when an LSP attaches to a particular buffer.
-- That is to say, every time a new file is opened that is associated with
-- an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
-- function will be executed to configure the current buffer
-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
--   callback = function(event)
--   end,
-- })
