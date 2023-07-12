local M = {}

-- Default mappings. Feel free to modify or remove as you wish.
-- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/v2.x/lua/neo-tree/defaults.lua
--

M.keymap = {
  ["o"] = {
    "open",
    nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
  },
  ["<Tab>"] = { "toggle_preview", config = { use_float = false } },

  -- copy relative path
  ["Y"] = function(state)
    local node = state.tree:get_node()
    -- local content = node.path
    -- relative
    local content = node.path:gsub(state.path, ""):sub(2)
    vim.fn.setreg('"', content)
    vim.fn.setreg("1", content)
    vim.fn.setreg("+", content)
  end,

  -- copy full (absolute path)
  ["gy"] = function(state)
    local node = state.tree:get_node()
    local content = node.path
    -- relative
    -- local content = node.path:gsub(state.path, ""):sub(2)
    vim.fn.setreg('"', content)
    vim.fn.setreg("1", content)
    vim.fn.setreg("+", content)
  end,
}

return M
