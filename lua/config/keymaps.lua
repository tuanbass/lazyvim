-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local utils = require("utils.keys")
utils.safe_map("n", "<leader>wm", "<cmd>:ScopeMoveBuf<CR>", { desc = "Move Buf to Tab" })

utils.safe_map("n", "<leader>gx", "", { desc = "Git conflict" })
utils.safe_map("n", "<leader>gx]", "<Plug>git-conflict-prev-conflict", { desc = "Next conflict" })
