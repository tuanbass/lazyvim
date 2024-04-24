-- mini.files customizations
local yank_path = function(pattern)
  local MiniFiles = require("mini.files")
  local raw_path = MiniFiles.get_fs_entry().path
  local canonical_path = vim.fn.fnamemodify(raw_path, pattern)
  -- print("inside yank_relative_path", path, "..", relative_path)
  vim.fn.setreg("+", canonical_path)
  print("yanked:", canonical_path)
end

-- shortcut for yank path/dir in mini.files
local yank_relative_path = function() yank_path(":.") end
local yank_full_path = function() yank_path(":p") end
local yank_relative_dir = function() yank_path(":.:h") end
local yank_full_dir = function() yank_path(":h") end

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesBufferCreate",
  callback = function(args)
    vim.keymap.set("n", "gy", yank_relative_path, { buffer = args.data.buf_id })
    vim.keymap.set("n", "gY", yank_full_path, { buffer = args.data.buf_id })

    vim.keymap.set("n", "gd", yank_relative_dir, { buffer = args.data.buf_id })
    vim.keymap.set("n", "gD", yank_full_dir, { buffer = args.data.buf_id })
  end,
})
return {
  {
    "echasnovski/mini.files",
    lazy = false,
    opts = {
      windows = {
        preview = true,
        width_focus = 30,
        -- width_preview = 60,
        width_nofocus = 30, -- keep the same width as focus to avoid flickering
      },
      options = {
        -- Whether to use for editing directories
        -- contrast with folke's LazyVim, I prefer to use mini.files for directory
        use_as_default_explorer = true,
      },
      mappings = {
        close = "q",
        go_in = "L", -- go in, keep all window open
        -- go_in_plus = "l", -- go in, then close
        go_in_plus = "<Enter>", -- go in, then close
        go_out = "H", -- go out, keep all window open
        -- go_out_plus = "h", -- go out, then close
        go_out_plus = "<BS>", -- go out, then close
        reset = "<F2>",
        reveal_cwd = "@",
        show_help = "g?",
        synchronize = "=",
        trim_left = "<",
        trim_right = ">",
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    -- disable neotree, use mini.files instead. Also need to enable it in LazyExtras to keep folke's setup
    enabled = false,
  },
}

-- -- we overwrite behavior of neotree plugin here
--
-- local keymap = {
--   -- ["O"] = { "show_help", nowait = false, config = { title = "Order by 1", prefix_key = "o" } },
--   -- ["Oc"] = { "order_by_created", nowait = false },
--   -- ["Od"] = { "order_by_diagnostics", nowait = false },
--   -- ["Og"] = { "order_by_git_status", nowait = false },
--   -- ["Om"] = { "order_by_modified", nowait = false },
--   -- ["On"] = { "order_by_name", nowait = false },
--   -- ["Os"] = { "order_by_size", nowait = false },
--   -- ["Ot"] = { "order_by_type", nowait = false },
--   -- TODO: tricky, find an elegant way to control.  there is a small delay when press "o"
--   -- tempofix by delete all default mapping for "o<x>" in the neotree plugin
--   -- ~/.local/share/nvim_plugins/lazy-vim/lazy/neo-tree.nvim/lua/neo-tree/defaults.lua
--   ["o"] = { "open", nowait = true, config = { prefix_key = "" } },
--   ["oc"] = "noop",
--   ["od"] = "noop",
--   ["og"] = "noop",
--   ["om"] = "noop",
--   ["on"] = "noop",
--   ["os"] = "noop",
--   ["ot"] = "noop",
--   ["<Tab>"] = { "toggle_preview", config = { use_float = false } },
--
--   -- copy relative path
--   ["Y"] = function(state)
--     local node = state.tree:get_node()
--     -- local content = node.path
--     -- relative
--     local content = node.path:gsub(state.path, ""):sub(2)
--     vim.fn.setreg('"', content)
--     vim.fn.setreg("1", content)
--     vim.fn.setreg("+", content)
--   end,
--
--   -- copy full (absolute path)
--   ["gy"] = function(state)
--     local node = state.tree:get_node()
--     local content = node.path
--     -- relative
--     -- local content = node.path:gsub(state.path, ""):sub(2)
--     vim.fn.setreg('"', content)
--     vim.fn.setreg("1", content)
--     vim.fn.setreg("+", content)
--   end,
-- }
--
-- return {
--   {
--     "nvim-neo-tree/neo-tree.nvim",
--     enabled = neo_tree,
--     opts = {
--       window = {
--         mappings = keymap,
--       },
--     },
--   },
-- }
