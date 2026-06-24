-- Reload files on external changes
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  -- if issues, you can remove the "BufEnter" event
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Pack commands
vim.api.nvim_create_user_command("PackAdd", function(opts)
  vim.pack.add(opts.fargs)
end, { nargs = "+", desc = "Add plugins (:PackAdd <plugin> [plugin]..." })

vim.api.nvim_create_user_command("PackDelete", function(opts)
  vim.pack.del(opts.fargs)
end, { nargs = "+", desc = "Delete plugins (:PackDelete <plugin> [plugin]..." })

vim.api.nvim_create_user_command("PackUpdate", function(opts)
  -- check if arguments are passed
  if opts.args:match("%S") then
    local plugins = vim.split(opts.args, "%s+", { trimpempty = true })
    vim.pack.update(plugins)
  else
    vim.pack.update()
  end
  vim.pack.del(opts.fargs)
end, { nargs = "*", desc = "Delete plugins (:PackUpdate [plugin]..." })

-- Old habits die hard
vim.api.nvim_create_user_command("LspInfo", function(_)
  vim.cmd(":checkhealth vim.lsp")
end, { desc = "Check LSP health" })

-- Copy buffer filepath
vim.api.nvim_create_user_command("CopyPath", function(context)
  local full_path = vim.fn.glob("%:p")

  local file_path = nil
  if context["args"] == "nameonly" then
    file_path = vim.fn.fnamemodify(full_path, ":t")
  end

  -- get the file path relative to project root
  if context["args"] == "relative" then
    local project_marker = { ".git", "pyproject.toml" }
    local project_root = vim.fs.root(0, project_marker)
    if project_root == nil then
      vim.print("can not find project root")
      return
    end

    if full_path:sub(1, #project_root) == project_root then
      file_path = "<project-root>" .. full_path:sub(#project_root + 1, -1)
    end
  end

  if context["args"] == "absolute" then
    file_path = full_path
  end

  vim.fn.setreg("+", file_path)
  vim.print("Filepath copied to clipboard!")
end, {
  bang = false,
  nargs = 1,
  force = true,
  desc = "Copy current file path to clipboard",
  complete = function()
    return { "nameonly", "relative", "absolute" }
  end,
})
