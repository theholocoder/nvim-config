--[[
-- A super powerful autopair plugin for Neovim that supports multiple characters.
-- A collection of quality-of-life features related to folding.
--]]
vim.pack.add({
  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/chrisgrieser/nvim-origami",
})

require("nvim-autopairs").setup()

require("origami").setup({
  autoFold = {
    enabled = true,
  },
})
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
