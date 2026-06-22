--[[
-- Library of 40+ independent Lua modules improving overall Neovim (version 0.8 and higher) experience with minimal
-- effort. They all share same configuration approaches and general design principles.
-- Think about this project as "Swiss Army knife" among Neovim plugins: it has many different independent tools
-- (modules) suitable for most common tasks. Each module can be used separately without any startup and usage overhead.
--]]
vim.pack.add({
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/rafamadriz/friendly-snippets",
})

-- Better icons
require("mini.icons").setup()

-- Status line
local statusline = require("mini.statusline")
statusline.setup({
  use_icons = true
})
statusline.section_location = function()
  return '%2l:%-2v'
end

-- Better surround and around/inside
require("mini.ai").setup({ n_lines = 500 })
require("mini.surround").setup()
require("mini.cursorword").setup() -- highlight hovered word

-- Sessions
require("mini.sessions").setup({ autowrite = true })
vim.keymap.set("n", "<leader>S", ":mksession<CR>", { desc = "Create a session for this project" })

-- Move code around
require("mini.move").setup({
  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
    left = '<C-left>',
    right = '<C-right>',
    down = '<C-down>',
    up = '<C-up>',

    -- Move current line in Normal mode
    line_left = '<C-left>',
    line_right = '<C-right>',
    line_down = '<C-down>',
    line_up = '<C-up>',
  },
})

-- Commandline completion
require("mini.cmdline")

-- Code completion
local function pad(str, len)
  return str .. string.rep(" ", math.max(0, len - #str))
end
local icons = {
  Text          = pad("󰉿 Text", 18),
  Method        = pad("󰆧 Method", 18),
  Function      = pad("󰊕 Function", 18),
  Constructor   = pad(" Constructor", 18),
  Field         = pad("󰇽 Field", 18),
  Variable      = pad("󰀫 Variable", 18),
  Class         = pad("󰠱 Class", 18),
  Interface     = pad(" Interface", 18),
  Module        = pad("󰏗 Module", 18),
  Property      = pad("󰜢 Property", 18),
  Unit          = pad("󰑭 Unit", 18),
  Value         = pad("󰎠 Value", 18),
  Enum          = pad(" Enum", 18),
  Keyword       = pad("󰌋 Keyword", 18),
  Snippet       = pad(" Snippet", 18),
  Color         = pad("󰏘 Color", 18),
  File          = pad("󰈙 File", 18),
  Reference     = pad("󰈇 Reference", 18),
  Folder        = pad("󰉋 Folder", 18),
  EnumMember    = pad(" EnumMember", 18),
  Constant      = pad("󰏿 Constant", 18),
  Struct        = pad("󰙅 Struct", 18),
  Event         = pad(" Event", 18),
  Operator      = pad("󰆕 Operator", 18),
  TypeParameter = pad("󰅲 TypeParameter", 18),
}

for i, kind in ipairs(vim.lsp.protocol.CompletionItemKind) do
  if icons[kind] then
    vim.lsp.protocol.CompletionItemKind[i] = icons[kind]
  end
end

vim.opt.completeitemalign = {
  "kind",
  "abbr",
  "menu",
}
local minicompletion = require("mini.completion")
minicompletion.setup({
  lsp_completion = {
    auto_setup = true,
    process_items = function(items, base)
      return minicompletion.default_process_items(items, base, {
        kind_priority = {
          Snippet = 0,
          Text = 100,
          Method = 200,
          Function = 200,
          Constructor = 200,
          Field = 200,
          Variable = 200,
          Class = 200,
          Interface = 200,
          Module = 200,
          Property = 200,
          Unit = 200,
          Value = 200,
          Enum = 200,
          Keyword = 200,
          Color = 200,
          File = 200,
          Reference = 200,
          Folder = 200,
          EnumMember = 200,
          Constant = 200,
          Struct = 200,
          Event = 200,
          Operator = 200,
          TypeParameter = 200,
        },
      })
    end,
  }
})

local minisnippets = require("mini.snippets")
minisnippets.setup({
  -- use <c-j> to expand a snippet
  snippets = {
    minisnippets.gen_loader.from_lang(),
  },
})
minisnippets.start_lsp_server({ match = false })
