--[[
-- A collection of small QoL plugins for Neovim.
--]]
vim.pack.add({ "https://github.com/folke/snacks.nvim" })

local snacks = require("snacks")
snacks.setup({
  dashboard = {
    enabled = true,
    sections = {
      { section = "header" },
      { section = "recent_files", cwd = true, limit = 8,  padding = 1 },
      { section = "keys",         gap = 1,    padding = 1 },
      {
        section = "terminal",
        cmd = "pokemon-colorscripts -r 1 --no-title; sleep .1",
        random = 10,
        pane = 2,
        indent = 4,
        height = 30,
      },
    },
    preset = {
      keys = {
        { icon = " ", key = "f", desc = "Find File", action = ":lua require('telescope.builtin').find_files()" },
        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
        { icon = " ", key = "g", desc = "Find Text", action = ":lua require('telescope.builtin').live_grep()" },
        {
          icon = " ",
          key = "s",
          desc = "Restore Session",
          action = function()
            local sessions = require("mini.sessions")
            local latest = sessions.get_latest()
            print(latest)
            if latest ~= nil then
              sessions.read(latest)
            end
          end
        },
        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
      },
    },
  },
  bigfile = { enabled = true },
  bufdelete = { enabled = true },
  image = {
    enabled = true,
    doc = {
      inline = false,
      max_width = 40,  -- max width of the image in characters
      max_height = 20, -- max height of the image in characters
    }
  },
  lazygit = { enabled = true },
  notifier = {
    enabled = true,
    style = "fancy",
    timeout = 5000,
  },
  quickfile = { enabled = true },
  terminal = { enabled = true },
})

vim.keymap.set("n", "<leader>H", function() snacks.dashboard.open() end, { desc = "Open the dashboard" })
vim.keymap.set("n", "<leader>gf", function() snacks.lazygit.log_file() end, { desc = "Open the current file logs" })
vim.keymap.set("n", "<leader>n", function() snacks.notifier.show_history() end, { desc = "Notification history" })
vim.keymap.set("n", "<leader>bd", function() snacks.bufdelete() end, { desc = "Close buffer" })
vim.keymap.set("n", "<leader>bad", function() snacks.bufdelete.all() end, { desc = "Close all buffers" })
