--[[
-- Getting you where you want with the fewest keystrokes.
--]]
vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  --
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
})

local harpoon = require("harpoon")
harpoon:setup({
  settings = {
    save_on_toggle = true,
  },
})

local harpoon_extensions = require("harpoon.extensions")
harpoon:extend(harpoon_extensions.builtins.highlight_current_file())
harpoon:extend(harpoon_extensions.builtins.navigate_with_number());

vim.keymap.set("n", "<leader>h", function()
  harpoon:list():add()
  vim.notify("Added to harpoon", vim.log.levels.INFO)
end, { desc = "Add file to harpoon" })
vim.keymap.set("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon list" })

vim.keymap.set("n", "<A-h>", function()
  harpoon:list():select(1)
end, { desc = "Harpoon position 1" })
vim.keymap.set("n", "<A-j>", function()
  harpoon:list():select(2)
end, { desc = "Harpoon position 2" })
vim.keymap.set("n", "<A-k>", function()
  harpoon:list():select(3)
end, { desc = "Harpoon position 3" })
vim.keymap.set("n", "<A-l>", function()
  harpoon:list():select(4)
end, { desc = "Harpoon position 4" })
