return {

  { -- j/k to escape
    "max397574/better-escape.nvim",
    cond = function()
      return vim.g.vscode ~= 1
    end,
    config = function()
      require("better_escape").setup({
        mapping = { "jk", "jj", "kj", "kk" }, -- a table with mappings to use
        keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
      })
    end,
  },
}

-- There are some preconfigured shortcuts that are very handy:
--     { "za", desc = "Toggle fold" },
--     { "<leader>ss", desc = "Navigate all function" },
--     { "gd", desc = "Go to definition" },
--

-- also mapped j to gj. (difference in the wrap mode: gj go down by screen line, j go down by logical line)
