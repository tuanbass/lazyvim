-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
require("utils.cmd").createAutoCommand({
  {
    "BufEnter",
    "*",
    ":setlocal formatoptions-=t<cr>",
  },
})
