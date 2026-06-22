--[[
-- Cloak allows you to overlay *'s (or any other character) over defined patterns in defined files. It also disables
-- 'cmp' for the buffer (if it is installed).
--]]
vim.pack.add({ "https://github.com/laytan/cloak.nvim" })

require("cloak").setup({
  enabled = true,
  cloak_telescope = true,
  cloak_character = "🙈",
  cloak_on_leave = true,
})

vim.keymap.set("n", "<leader>ct", ":CloakToggle<CR>", {
  desc = "Cloak toggle",
})
