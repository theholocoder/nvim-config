-- Restart
vim.keymap.set("n", "<leader>re", "<cmd>restart<cr>", { desc = "Restart Neovim (:restart)" })

-- Execute lua stuff
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute Lua file" })
vim.keymap.set({ "n", "v" }, "<leader>x", ":.lua<CR>", { desc = "Execute Lua code" })

-- Make my life easier
vim.keymap.set("n", "]t", ":tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "[t", ":tabprevious<CR>", { desc = "Previous tab" })
vim.keymap.set("i", "<S-Tab>", "<C-d>")
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })
vim.keymap.set({ "i", "v" }, "<C-s>", "<Esc>:w<CR>", { desc = "Save file" })
vim.keymap.set({ "i", "n", "v" }, "<Esc>", "<Esc>:noh<CR>", { desc = "Quit mode" })
vim.keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Unindent and keep selection" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines without moving" })

-- Center on screen after moving
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Move to next match" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Move to previous match" })

-- Search better
vim.keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word under cursor" })

-- Copy/replace better
vim.keymap.set("x", "p", '"_dP', { desc = "Paste without yanking" })

-- Quickfix list
vim.keymap.set("n", "]q", ":cn<CR>", { desc = "Go to next element in quickfix list" })
vim.keymap.set("n", "[q", ":cp<CR>", { desc = "Go to previous element in quickfix list" })

-- Split better
vim.keymap.set("n", "<leader>|", "<C-w>v<C-w>l<C-w>16<", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>_", "<C-w>s<C-w>j<C-w>8-", { desc = "Split horizontally" })
vim.keymap.set("n", "<A->>", "<C-w>4>", { desc = "Increase pane size" })
vim.keymap.set("n", "<A-<>", "<C-w>4<", { desc = "Decrease pane size" })
vim.keymap.set("n", "<A-+>", "<C-w>4+", { desc = "Increase pane size" })
vim.keymap.set("n", "<A-->", "<C-w>4-", { desc = "Decrease pane size" })

-- Avoid noob mistakes with vim
vim.keymap.set("n", "Q", "<Nop>", { desc = "Disable Ex mode" })

-- Marks
vim.keymap.set("n", "<leader>`", "<C-o>", { desc = "Jump to previous location" })

-- Wrap/Unwrap
vim.keymap.set("n", "<leader>ww", ":set wrap<CR>", { desc = "Wrap: line wrapping" })
vim.keymap.set("n", "<leader>wn", ":set nowrap<CR>", { desc = "Wrap: no wrapping" })

-- Native undotree
vim.keymap.set("n", "<leader>u", function()
  vim.cmd.packadd("nvim.undotree")
  require("undotree").open()
end, { desc = "Open undotree" })

-- Terminal
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Copy filepath
vim.keymap.set("n", "<leader>y", ":CopyPath relative<CR>", { desc = "Copy file path relative to project root" })
vim.keymap.set("n", "<leader>Y", ":CopyPath absolute<CR>", { desc = "Copy absolute file path" })
vim.keymap.set("n", "<leader>N", ":CopyPath nameonly<CR>", { desc = "Copy file name" })
