--[[
-- Slumber is a TUI HTTP Client (like postman)
--]]
local M = {}
M.slumber = function()
  -- first check if there is a `slumber.yml` file in the project root
  local slumber_file = vim.fn.expand("%:p:h") .. "/slumber.yml"
  if vim.fn.filereadable(slumber_file) == 0 then
    vim.notify("No slumber.yml file found in the project root", vim.log.levels.ERROR)
    return
  end

  local Terminal = require("toggleterm.terminal").Terminal
  local term = Terminal:new {
    cmd = "slumber",
    hidden = true,
    direction = "float",
    float_opts = {
      border = "none",
      width = 100000,
      height = 100000,
    },
    on_open = function(_)
      vim.cmd "startinsert!"
    end,
    on_close = function(_) end,
    count = 99,
  }
  term:toggle()
end

vim.keymap.set("n", "<leader>ts", function() M.slumber() end, { desc = "Open Slumber (TUI HTTP Client)" })

return M
