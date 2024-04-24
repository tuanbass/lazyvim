return {
  {
    "zbirenbaum/copilot.lua",

    config = function(plugin) require("copilot").setup(plugin.opts) end,

    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        help = true,
        markdown = true,
        text = false,
        csv = false,
        tsv = false,
      },
    },

    -- also auto load nvim-cmp and copilot-cmp from the base
  },

  {
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      branch = "canary",
      lazy = false,
      dependencies = {
        { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
        { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
      },
      opts = {
        debug = false, -- Enable debugging
        -- See Configuration section for rest
      },
      keys = {
        {
          "<leader>cch",
          function()
            print("loading action..")
            local actions = require("CopilotChat.actions")
            print("loaded action")
            local action = actions.help_actions()
            require("CopilotChat.integrations.telescope").pick(action)
            print("end func")
          end,
          desc = "CopilotChat - Help actions",
        },
      },
      -- See Commands section for default commands if you want to lazy load on them
    },
  },
}
