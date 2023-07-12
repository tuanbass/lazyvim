-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
local opt = vim.opt

opt.foldcolumn = "1" -- '0' is not bad
opt.foldlevel = 2 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 2
opt.foldenable = true

opt.formatoptions = "jcrql" -- disable comment continuation with "o"

opt.winminwidth = 1 -- required for TaDaa/vimade work properly
