-- lsp, autocomplete, snippets, etc

return {
  {
    "hrsh7th/cmp-nvim-lua",
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
  -- {
  --   "simrat39/inlay-hints.nvim",
  -- },
  {
    -- autocomplete for command mode and search mode
    "hrsh7th/cmp-cmdline",
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
        completion = {
          completeopt = vim.g.cmdline_autocomplete_opts,
        },
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
  -- { "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim", config = function() require("toggle_lsp_diagnostics").init() end }, -- no need, lazyvim already have builtin support with <leader>ud
  {
    -- It does not work at the moment.
    -- https://github.com/ThePrimeagen/refactoring.nvim/issues/404

    "ThePrimeagen/refactoring.nvim",
    opts = {},
    config = function(_, opts)
      local refactoring = require("refactoring")
      -- local map = require("user.util").map

      refactoring.setup(opts)

      vim.keymap.set({ "v", "n" }, "<leader>rr", refactoring.select_refactor, { noremap = true })
      -- vim.keymap.set("n", "s", require("substitute").operator, { noremap = true })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  { "mattn/webapi-vim" }, -- used for `:RustPlay` command
  -- {  -- disable, as not work at  the moment in Lazy vim
  --   "smjonas/inc-rename.nvim",
  -- },
  -- auto turn off ibus when entering normal mode
  -- Notes: it does not work if manually switch to ibus (vietnamese) in normal mode
  -- { "kevinhwang91/nvim-ibus-sw", config = function() require("ibus-sw").setup() end },

  -- auto change a closed tag when change the open one and vice versa
  { "AndrewRadev/tagalong.vim" },
  -- look up the diagnostics with ChatGPT
  {
    "piersolenski/wtf.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {},
    keys = {
      {
        "<C-g>w",
        mode = { "n", "x" },
        function() require("wtf").ai() end,
        desc = "GPT Diag",
      },
      {
        mode = { "n" },
        "<C-g>W",
        function() require("wtf").search() end,
        desc = "Search Diag",
      },
    },
  },
}
