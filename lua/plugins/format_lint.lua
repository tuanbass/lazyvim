return {
  -- formatter configuration
  {

    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- prefer prettierd than prettier for faster format
        -- awared about https://github.com/LazyVim/LazyVim/issues/712
        -- from issus description, seem it occures only with yaml file
        ["javascript"] = { { "prettierd", "prettier" } },
        ["typescript"] = { { "prettierd", "prettier" } },
      },
    },
  },

  -- linter configuration
  -- Notes: by default, for js/ts, it uses vscode-eslint-language-server
  --
  {
    "nvim-lint",
    opts = {
      -- Event to trigger linters
      -- events = { "BufWritePost", "BufReadPost", "InsertLeave" },
      linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        -- fish = { "fish" },
        -- Use the "*" filetype to run linters on all filetypes.
        -- ['*'] = { 'global linter' },
        -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
        -- ['_'] = { 'fallback linter' },
      },
      -- LazyVim extension to easily override linter options
      -- or add custom linters.
      ---@type table<string,table>
      linters = {
        -- -- Example of using selene only when a selene.toml file is present
        -- selene = {
        --   -- `condition` is another LazyVim extension that allows you to
        --   -- dynamically enable/disable linters based on the context.
        --   condition = function(ctx)
        --     return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })[1]
        --   end,
        -- },
      },
    },
  },
}
