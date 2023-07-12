return {
  {
    "TaDaa/vimade",
    config = function(plugin)
      vim.g.vimade = {
        basegroups = {
          -- "Folded",
          -- "Search",
          -- "SignColumn",
          -- -- "LineNr",
          -- -- "CursorLine",
          -- -- "CursorLineNr",
          -- "DiffAdd",
          -- "DiffChange",
          -- "DiffDelete",
          -- "DiffText",
          -- "FoldColumn",
          -- "Whitespace",
          -- "NonText",
          -- "SpecialKey",
          -- "Conceal",
          -- "EndOfBuffer",
        },
      }
    end,
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        width = 180,
      },
    },
    keys = { { "<leader>vz", "<cmd>ZenMode<cr>", desc = "Zen mode" } },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
  },
}
