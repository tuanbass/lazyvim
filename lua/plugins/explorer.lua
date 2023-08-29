-- we overwrite behavior of neotree plugin here

local keymap = {
  ["o"] = {
    "open",
    nowait = true, -- disable `nowait` if you have existing combos starting with this char that you want to use
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

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = keymap,
      },
    },
  },
}
