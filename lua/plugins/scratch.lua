return {
  {
    "konfekt/vim-scratchpad",
    keys = { { "<leader>vs", "<Plug>(ToggleScratchPad)", desc = "Scratpad" } },
    config = function()
      vim.g.scratchpad_ftype = "txt"
      -- vim.g.scratchpad_path = vim.fn.stdpath("data") .. "/.scratchpads"
      vim.g.scratchpad_path = os.getenv("HOME") .. "/.scratchpads"
    end,
  },
  {
    "m-demare/attempt.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function(plugin)
      require("attempt").setup({
        dir = os.getenv("HOME") .. "/.attempt/",
      })
      local telescope = require("telescope")
      telescope.load_extension("attempt")
    end,
    keys = {
      { "<leader>va", desc = "+Attemp" },
      {
        "<leader>van",
        function()
          require("attempt").new_select()
        end,
        desc = "New...",
      },
      {
        "<leader>vaN",
        function()
          require("attempt").new_input_ext()
        end,
        desc = "New(ext)... ",
      },
      {
        "<leader>vax",
        function()
          require("attempt").run()
        end,
        desc = "eXecute...",
      },
      {
        "<leader>vad",
        function()
          require("attempt").delete_buf()
        end,
        desc = "Delete...",
      },
      {
        "<leader>var",
        function()
          require("attempt").rename_buf()
        end,
        desc = "Rename...",
      },
      { "<leader>val", "<cmd> Telescope attempt <CR>", desc = "List..." },
    },
  },
}
