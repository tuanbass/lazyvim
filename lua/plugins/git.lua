return {
  {
    "TimUntersberger/neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<CR>", desc = "Neogit" },
      { "<leader>gC", "<cmd>Telescope git_bcommits<CR>", desc = "bcommits" },
    },
    opts = {
      disable_commit_confirmation = true, -- workaround for conflict with Noice, see https://github.com/folke/noice.nvim/issues/232
      integrations = {
        diffview = true,
      },
    },
  },
  {
    "f-person/git-blame.nvim",
  },
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
  },
  {
    "akinsho/git-conflict.nvim",
  },
  {
    "lewis6991/gitsigns.nvim",

    -- keys = { -- no need, already defined as ]h or [h]
    --   { "<leader>gn", "<cmd>Gitsigns next_hunk<CR>", desc = "NextHunk" },
    --   { "<leader>gN", "<cmd>Gitsigns prev_hunk<CR>", desc = "PrevHunk" },
    -- },
  },
  --
}
