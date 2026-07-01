--[[
-- GitLab Todo Manager
--
-- Opens an editable scratch buffer listing pending GitLab todos (via `glab`).
-- Delete lines and save (:w) to mark the corresponding todos as done on GitLab.
-- After processing, the buffer is reloaded with the remaining todos.
--
-- Command: :GlabTodo
-- Filetype: glabtodo
-- Buffer name: glab://todos
--]]
vim.pack.add({ "https://github.com/theholocoder/glab-todo.nvim" })
require("glab-todo").setup();
vim.keymap.set("n", "<leader>glt", "<CMD>GlabTodo<CR>", { desc = "Open glab todo manager" })
