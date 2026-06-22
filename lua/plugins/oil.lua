--[[
-- A vim-vinegar like file explorer that lets you edit your filesystem like a normal Neovim buffer.
--]]
vim.pack.add({ "https://github.com/stevearc/oil.nvim" })
require("oil").setup({
  watch_for_changes = true,
  view_options = {
    show_hidden = true
  },
  preview_win = {
    preview_method = "fast_scratch",
    -- preview_method = "load",
  },
  float = {
    border = "single",
  },
  keymaps = {
    ["gd"] = {
      desc = "Toggle file detail view",
      callback = function()
        detail = not detail
        if detail then
          require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
        else
          require("oil").set_columns({ "icon" })
        end
      end,
    },
  },
})

vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
