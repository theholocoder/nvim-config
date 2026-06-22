--[[
-- telescope.nvim is a highly extendable fuzzy finder over lists. Built on the latest awesome features from neovim core.
-- Telescope is centered around modularity, allowing for easy customization.
--]]
local function build_telescope_fzf(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  -- Run build script after plugin's code has changed
  if name == "telescope-fzf-native" and (kind == "install" or kind == "update") then
    vim.system({ 'make' }, { cwd = ev.data.path })
  end
end
vim.api.nvim_create_autocmd('PackChanged', { callback = build_telescope_fzf })
vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", name = "telescope-fzf-native" },
  "https://github.com/nvim-telescope/telescope-ui-select.nvim",
  "https://github.com/nvim-telescope/telescope-file-browser.nvim",
  --
  "https://github.com/nvim-telescope/telescope.nvim",
})
------------------------------------------------------------------------------------------------
local ts_select_dir_for_grep = function(prompt_bufnr)
  local action_state = require("telescope.actions.state")
  local fb = require("telescope").extensions.file_browser
  local live_grep = require("telescope.builtin").live_grep
  local current_line = action_state.get_current_line()

  fb.file_browser({
    files = false,
    depth = false,
    attach_mappings = function(prompt_bufnr)
      require("telescope.actions").select_default:replace(function()
        local entry_path = action_state.get_selected_entry().Path
        local dir = entry_path:is_dir() and entry_path or entry_path:parent()
        local relative = dir:make_relative(vim.fn.getcwd())
        local absolute = dir:absolute()

        live_grep({
          results_title = relative .. "/",
          cwd = absolute,
          default_text = current_line,
        })
      end)

      return true
    end,
  })
end
------------------------------------------------------------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopePrompt",
  callback = function(args)
    -- disable vim completion in telescope buffer
    vim.bo[args.buf].autocomplete = false
  end,
})
------------------------------------------------------------------------------------------------
require("telescope").setup({
  defaults = {
    layout_config = {
      vertical = { prompt_position = "top" },
      horizontal = { prompt_position = "top" },
    },
    winblend = 0, -- no transparency
    sorting_strategy = "ascending",
  },
  pickers = {
    live_grep = {
      additional_args = function()
        return { "--hidden" }
      end,
      mappings = {
        i = {
          ["<C-f>"] = ts_select_dir_for_grep,
        },
        n = {
          ["<C-f>"] = ts_select_dir_for_grep,
        },
      },
    },
    find_files = {
      hidden = true,
      find_command = {
        "rg",
        "-u",
        "--files",
        "--hidden",
        "-g",
        "!.git/*",
        "-g",
        "!**/.git/*",
        "-g",
        "!**/node_modules/*",
        "-g",
        "!**/.pnpm-store/*",
        "-g",
        "!**/vendor/*",
        "-g",
        "!**/docs/*",
        "-g",
        "!**/dist/*",
        "-g",
        "!**/var/*",
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({}),
    },
  },
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("ui-select")

-- keymapping
local builtin = require("telescope.builtin")

-- Search
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search help" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search keymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search files" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search current word" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search with grep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search diagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Resume previous search" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = 'Search Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader>s`", builtin.marks, { desc = "List existing marks" })
vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Search buffers" })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set("n", "<leader>s/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = "Fuzzily search in current buffer" })

-- Also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set("n", "<leader>sF", function()
  builtin.live_grep({
    grep_open_files = true,
    prompt_title = "Live Grep in Open Files",
  })
end, { desc = "Search in opened files" })

-- Shortcut for searching all project files
vim.keymap.set("n", "<leader>sP", function()
  builtin.find_files({
    hidden = true,
    find_command = { "rg", "-u", "--files", "--hidden" },
  })
end, { desc = "Search all project files" })

-- Shortcut for searching your neovim configuration files
vim.keymap.set("n", "<leader>sn", function()
  builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Search Neovim files" })

-- LSP
vim.keymap.set("n", "<leader>D", builtin.lsp_type_definitions, { desc = "Type definition" })
vim.keymap.set("n", "<leader>r", builtin.lsp_references, { desc = "Search references (usage)" })
