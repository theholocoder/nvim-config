--[[
-- A plugin for opening a terminal in a floating window.
--]]
vim.pack.add({ "https://github.com/akinsho/toggleterm.nvim" })

require("toggleterm").setup({
  open_mapping = [[<F1>]],
})
