--[[
-- A Neovim plugin that automatically installs and enables the Omarchy theme, if you don't use LazyVim.
--]]
vim.pack.add({ "https://github.com/theholocoder/omarchy-pack-theme.nvim" })
require("omarchy-pack-theme").setup()
