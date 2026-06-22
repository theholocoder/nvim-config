--[[
-- Dadbod is a Vim plugin for interacting with databases.
--]]
vim.pack.add({
  "https://github.com/tpope/vim-dadbod",
  "https://github.com/kristijanhusak/vim-dadbod-completion",
  --
  "https://github.com/kristijanhusak/vim-dadbod-ui",
})
vim.g.db_ui_use_nerd_fonts = 1

vim.keymap.set("n", "<leader>db", function()
  vim.cmd("tabnew")
  vim.cmd("DBUI")
end, { desc = "Open Dadbod DBUI" })
