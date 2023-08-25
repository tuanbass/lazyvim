-- create some custome hot keys

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
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
  },
  -- {
  --   "f-person/git-blame.nvim", --show git blame for current line. No need, as there is a supported with git signts
  -- },
  {
    "akinsho/git-conflict.nvim",
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim", -- work with hunk in git
    opts = {
      current_line_blame = true,
    },

    -- keys = { -- no need, already defined as ]h or [h]
    --   { "<leader>gn", "<cmd>Gitsigns next_hunk<CR>", desc = "NextHunk" },
    --   { "<leader>gN", "<cmd>Gitsigns prev_hunk<CR>", desc = "PrevHunk" },
    -- },
  },
  --
}
