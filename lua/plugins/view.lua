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
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
        numbers = function(opts)
          return string.format("%s", opts.id)
        end,
      }, -- always show tabs, event if there is only one tab
    },
  },
  {
    -- asscociate buffer to tab
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup()
    end,
  },
  {
    "folke/edgy.nvim",
    opts = {
      animate = {
        enabled = false,
      },
    },
  },
}
