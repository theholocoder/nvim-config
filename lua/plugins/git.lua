--[[
-- Git stuff
--]]
vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

require("gitsigns").setup({
  current_line_blame = true,
})
vim.keymap.set("n", "<leader>gb", "<CMD>Gitsigns blame<CR>", { desc = "Git blame" })
vim.keymap.set("n", "<leader>gh", "<CMD>Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
vim.keymap.set("n", "[h", "<CMD>Gitsigns prev_hunk <CR>", { desc = "Previous hunk" })
vim.keymap.set("n", "]h", "<CMD>Gitsigns next_hunk<CR>", { desc = "Next hunk" })
