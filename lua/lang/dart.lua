local is_disabled = require("utils.func").find(vim.g.disabled_lang, "dart")
if is_disabled then return {} end

print("Loading dart config...")
return {
  {
    "akinsho/flutter-tools.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    opts = { -- for parameters, refer to ~/.local/share/nvim_plugins/lazy-vim/lazy/flutter-tools.nvim/lua/flutter-tools/config.lua
      lsp = {
        cmd = { "dart", "language-server", "--protocol=lsp" },
      },
    },
  },
}
