-- lsp, autocomplete, snippets, etc

return {
  {
    "hrsh7th/cmp-nvim-lua",
    commit = "f3491638d123cfd2c8048aefaf66d246ff250ca6",
    -- after = "nvim-cmp",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
  },
  {
    -- signature as you type
    "ray-x/lsp_signature.nvim",
    -- commit = "1979f1118e2b38084e7c148f279eed6e9300a342",
    -- after = "nvim-lspconfig",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    event = "VeryLazy",
    opts = {
      border = "single",
    },
  },
  {
    -- autocomplete for command mode and search mode
    "hrsh7th/cmp-cmdline",
    commit = "23c51b2a3c00f6abc4e922dbd7c3b9aca6992063",
    after = "nvim-cmp",
    config = function(p)
      local cmp = require("cmp")

      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- autocomplete for search
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
      })
    end,
  },
  -- {  -- disable, as not work at  the moment in Lazy vim
  --   "smjonas/inc-rename.nvim",
  -- },
}
