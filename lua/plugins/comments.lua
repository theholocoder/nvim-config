--[[
-- Quick comment code with <leader>/
-- Find Todo comments in code with telescope.
--]]
vim.pack.add({
  "https://github.com/numtostr/comment.nvim",

  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/folke/todo-comments.nvim",
})

require("Comment").setup();
vim.keymap.set("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment" })
vim.keymap.set(
  "v",
  "<leader>/",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Toggle comment" }
)

require("todo-comments").setup()
vim.keymap.set("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "Toggle comment" })
