vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" } })

local treesitter = require("nvim-treesitter")
local ensure_intalled = {
  "query", "markdown", "markdown_inline",
  "javascript", "typescript",
  "php",
  "html",
  "css",
  "angular",
  "astro",
  "bash",
  "json", "yaml",
}

treesitter.install(ensure_intalled)
-- Angular templates
vim.filetype.add({
  pattern = {
    [".*%.component%.html"] = "htmlangular", -- Sets the filetype to `htmlangular` if it matches the pattern
  },
})

-- mdx files
vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})
vim.treesitter.language.register("markdown", "mdx")

-- Dockerfile issue
vim.treesitter.language.register("dockerfile", "Dockerfile")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    local buf = args.buf
    local ft = vim.bo[buf].filetype

    local lang = vim.treesitter.language.get_lang(ft)
    if not lang then
      return
    end

    local ok_add = pcall(vim.treesitter.language.add, lang)
    if not ok_add then
      return
    end

    pcall(vim.treesitter.start, buf, lang)
  end,
})
