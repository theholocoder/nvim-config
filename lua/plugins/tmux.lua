--[[
-- When combined with a set of tmux key bindings, the plugin will allow you to navigate seamlessly between vim and
-- tmux splits using a consistent set of hotkeys.
--]]
vim.pack.add({ "https://github.com/alexghergh/nvim-tmux-navigation" })

require("nvim-tmux-navigation").setup({})
vim.keymap.set("n", "<C-h>", ":NvimTmuxNavigateLeft<CR>", { desc = "Navigate left (tmux compatible)" })
vim.keymap.set("n", "<C-j>", ":NvimTmuxNavigateDown<CR>", { desc = "Navigate down (tmux compatible)" })
vim.keymap.set("n", "<C-k>", ":NvimTmuxNavigateUp<CR>", { desc = "Navigate up (tmux compatible)" })
vim.keymap.set("n", "<C-l>", ":NvimTmuxNavigateRight<CR>", { desc = "Navigate right (tmux compatible)" })
