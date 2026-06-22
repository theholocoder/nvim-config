local set = vim.opt
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- encoding
vim.scriptencoding = "utf-8"
set.encoding = "utf-8"
set.fileencoding = "utf-8"

-- tabulations and intendation
set.expandtab = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.breakindent = true
set.wrap = false
set.linebreak = true
set.smartindent = true

-- line numbers
set.number = true
set.relativenumber = true
set.colorcolumn = "120"
set.signcolumn = "yes"
set.scrolloff = 10

-- search and highlighting
set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.cursorline = true

-- clipboard
set.clipboard:append("unnamedplus")

-- modes
set.showmode = false --already in the statusline

-- splits
set.splitright = true
set.splitbelow = true
set.splitkeep = "screen"
set.inccommand = "split"
set.laststatus = 3 -- one status line for split buffers
set.cmdheight = 0  -- hide command line if not in use

-- autocompletion
set.autocomplete = true
set.pumborder = "rounded" -- auto complete popups border
set.pumheight = 7         -- auto complete popups number of elements

-- autoread files on external changes
set.autoread = true

-- swap files and undo settings
set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

-- enable mouse
set.mousemoveevent = true
set.mouse = "a"

-- shell
set.shell = "/bin/fish"
set.termguicolors = true
set.title = true

-- allow @ in filenames
set.isfname:append("@-@")

-- search
set.path:append({ "**" })
set.wildignore:append({ "*/node_modules/*" })
