require("vim._core.ui2").enable({})
require("options")
require("commands")
require("plugins.tmux")
require("keybinds")

-- Load plugins in order
-- Backend and LSP plugins
require("plugins.mini")
require("plugins.snacks")
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.conform")
require("plugins.telescope")

-- UI plugins
require("plugins.oil")
require("plugins.theme")
require("plugins.dropbar")
require("plugins.edgy")
require("plugins.flash")
require("plugins.harpoon")
require("plugins.terminal")
require("plugins.which-key")
require("plugins.spectre")

-- Code plugins
require("plugins.comments")
require("plugins.folding-pairing")
require("plugins.cloak")
require("plugins.supermaven")
require("plugins.git")
require("plugins.markdown")
-- require("plugins.slumber") -- enable only if needed
-- require("plugins.dadbod") -- enable only if needed
