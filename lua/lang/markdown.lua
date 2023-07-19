-- posible to install:
--  textlint: lint grammar
--  cbfmtt (format codeblock inside markdown)
--  deno_fmt????
--  markdownlint !!!
--  pretierd
--  rome

return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "markdownlint")
      table.insert(opts.ensure_installed, "marksman")
      -- table.insert(opts.ensure_installed, "remark-language-server")
    end,
  },
  {
    -- configure diagnostics and action
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      if type(opts.sources) == "table" then
        local nls = require("null-ls")
        vim.list_extend(opts.sources, {
          -- nls.builtins.code_actions.gomodifytags,
          -- nls.builtins.code_actions.impl,
          -- nls.builtins.formatting.gofumpt,
          nls.builtins.formatting.prettierd,
          nls.builtins.formatting.markdownlint,
          nls.builtins.diagnostics.markdownlint,
        })
      end
    end,
  },

  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      marksman = {},
      -- remark_ls = {},
    },
  },
  setup = {
    marksman = function() end,
    -- remark_ls = {},
  },

  {
    "iamcco/markdown-preview.nvim",
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
    -- cmd = { "MarkdownPreview" },
  },
  {
    "ekickx/clipboard-image.nvim",
    config = function()
      require("clipboard-image").setup({
        default = {
          img_name = function() -- ask for the image name
            vim.fn.inputsave()
            local name = vim.fn.input("Img Name: ")
            vim.fn.inputrestore()

            if name == nil or name == "" then
              return os.date("%y-%m-%d-%H-%M-%S")
            end
            return name
          end,
          img_dir = { "%:p:h", "img" }, -- the directory to save the image which is relative to the current file
        },
      })
    end,
    cmd = { "PasteImg" },
  },
}
