-- This provides some other tools for typescript, beyond of what is provided by folke

-- consider to include:
--    xo: eslint with great default
--    dprint: code formatting platform, with lots of plugin
--    rome: formater
--    standardts: eslint with standardjs rules, no need specific config file

return {
  {
    -- configure diagnostics and action
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      if type(opts.sources) == "table" then
        local null_ls = require("null-ls")
        vim.list_extend(opts.sources, {
          -- nls.builtins.code_actions.gomodifytags,
          -- nls.builtins.code_actions.impl,
          -- nls.builtins.formatting.gofumpt,
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.diagnostics.eslint_d,
          -- null_ls.builtins.code_actions.refactoring,
        })
      end
    end,
  },
}
