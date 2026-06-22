--[[
-- A polished, IDE-like, highly-customizable winbar for Neovim with drop-down menu support and multiple backends
--]]
vim.pack.add({ "https://github.com/Bekaboo/dropbar.nvim" })

local dropbar_api = require('dropbar.api')
vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
