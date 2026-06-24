--[[
-- Spectre is a plugin to do search and replace across files.
--]]
vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  --
  "https://github.com/nvim-pack/nvim-spectre",
})

local spectre = require('spectre')
spectre.setup()

vim.keymap.set("n", "<leader>sR", function()
  spectre.open_visual()
end, { desc = "Search and replace in visual mode" })
