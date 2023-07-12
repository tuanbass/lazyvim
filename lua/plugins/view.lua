return {
  {
    "TaDaa/vimade",
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
