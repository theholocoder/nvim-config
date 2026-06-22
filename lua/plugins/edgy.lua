--[[
-- A Neovim plugin to easily create and manage predefined window layouts, bringing a new edge to your workflow.
--]]
vim.pack.add({ "https://github.com/folke/edgy.nvim" })

require("edgy").setup({
  bottom = {
    {
      ft = "toggleterm",
      size = { height = 0.3 },
      -- exclude floating windows
      filter = function(_, win)
        return vim.api.nvim_win_get_config(win).relative == ""
      end,
    },
    {
      ft = "qf",
      title = "QuickFix",
    },
    {
      ft = "help",
      size = { height = 20 },
      -- only show help buffers
      filter = function(buf)
        return vim.bo[buf].buftype == "help"
      end,
    },
  },
})
