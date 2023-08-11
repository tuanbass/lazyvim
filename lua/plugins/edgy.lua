-- edgy
-- copy with modification from LazyVim/lua/lazyvim/plugins/extras/ui/edgy.lua
return {
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>ue",
        function() require("edgy").toggle() end,
        desc = "Edgy Toggle",
      },
      -- stylua: ignore
      { "<leader>uE", function() require("edgy").select() end, desc = "Edgy Select Window" },
    },
    opts = {
      left = {
        {
          title = "Neo-Tree1",
          ft = "neo-tree",
          filter = function(buf) return vim.b[buf].neo_tree_source == "filesystem" end,
          pinned = true,
          open = function() vim.api.nvim_input("<esc><space>e") end,
          size = { height = 0.5 },
        },
        -- { title = "Neotest Summary", ft = "neotest-summary" },
        -- {
        --   title = "Neo-Tree Git",
        --   ft = "neo-tree",
        --   filter = function(buf) return vim.b[buf].neo_tree_source == "git_status" end,
        --   pinned = true,
        --   open = "Neotree position=right git_status",
        -- },
        -- {
        --   title = "Neo-Tree Buffers",
        --   ft = "neo-tree",
        --   filter = function(buf) return vim.b[buf].neo_tree_source == "buffers" end,
        --   pinned = true,
        --   open = "Neotree position=top buffers",
        -- },
        "neo-tree",
      },
      right = {
        { title = "Neotest Summary", ft = "neotest-summary", size = { height = 0.5, width = 0.1 } },
      },
    },
  },
}
