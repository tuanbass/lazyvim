-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
local opt = vim.opt

opt.foldcolumn = "1" -- '0' is not bad
opt.foldlevel = 99 -- Using ufo plugin provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true
opt.shortmess = "F"

vim.g.ufo_fold_level_start = 2 -- start fold level when open new file. Not work yet.
opt.formatoptions = "jcrql" -- disable comment continuation with "o"

opt.winminwidth = 1 -- required for TaDaa/vimade work properly

-- default tab options, effective only if no .
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- invisible characters
opt.list = true
opt.listchars:append("eol:↴")
opt.listchars:append("tab:>>")

-- search options

-- completeoptions
-- opt.completeopt = "menu,menuone,preview,longest,noselect"

vim.g.cmdline_autocomplete_opts = "menu,menuone,preview,longest,noselect"
