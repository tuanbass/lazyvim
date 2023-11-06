-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local utils = require("utils.keys")
utils.safe_map("n", "<leader>wm", "<cmd>:ScopeMoveBuf<CR>", { desc = "Move Buf to Tab" })

-- TODO: use safe_map
-- register the short cut in which-key
local status, wk = pcall(require, "which-key")
if not status then return end -- no which key, no keymap. Forexample, we are running from vscode

wk.register({ x = { name = "+Conflict" } }, { prefix = "<leader>g" })

utils.safe_map("n", "<leader>gx", "", { desc = "Git conflict" })
utils.safe_map("n", "<leader>gx]", "<Plug>git-conflict-prev-conflict", { desc = "Next conflict" })

wk.register({ h = { name = "+Hunk    " } }, { prefix = "<leader>g" })
