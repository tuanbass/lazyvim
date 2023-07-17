return {
  {
    "TimUntersberger/neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<CR>", desc = "Neogit" },
      { "<leader>gC", "<cmd>Telescope git_bcommits<CR>", desc = "bcommits" },
    },
    opts = {
      disable_commit_confirmation = true,
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
    keys = {
      { "<leader>gn", "<cmd>Gitsigns next_hunk<CR>", desc = "NextHunk" },
      { "<leader>gN", "<cmd>Gitsigns prev_hunk<CR>", desc = "PrevHunk" },
    },
  },
  --
  -- enhanced yank
  -- {
  --   "gbprod/yanky.nvim",
  --   -- config = function(opts)
  --   --   require("yanky").setup(opts)
  --   -- end,
  --   keys = {
  --     {
  --       "gy",
  --       function()
  --         require("telescope").extensions.yank_history.yank_history({})
  --       end,
  --       desc = "Open Yank History",
  --     },
  --     -- other default shortcut can be found in $HOME/.local/share/nvim_plugins/lazyvim/lazy/LazyVim/lua/lazyvim/plugins/extras/coding/yanky.lua
  --   },
  -- },
  -- {
  --   "gbprod/substitute.nvim",
  --   config = function(opts)
  --     require("substitute").setup({
  --       highlight_substituted_text = {
  --         enabled = true,
  --         timer = 1000,
  --       },
  --     })
  --     vim.keymap.set("n", "s", require("substitute").operator, { noremap = true })
  --     vim.keymap.set("n", "ss", require("substitute").line, { noremap = true })
  --     vim.keymap.set("n", "S", require("substitute").eol, { noremap = true })
  --     vim.keymap.set("x", "s", require("substitute").visual, { noremap = true })
  --
  --     -- range substitute
  --     vim.keymap.set("n", "<leader>s", require("substitute.range").operator, { noremap = true })
  --     vim.keymap.set("x", "<leader>s", require("substitute.range").visual, { noremap = true })
  --
  --     vim.keymap.set("n", "<leader>ss", function()
  --       -- tricky: pass a empty table to subject to avoid nil exception
  --       require("substitute.range").word({ subject = {} })
  --     end, { noremap = true })
  --   end,
  -- },
  -- enhanced subtitude
}
