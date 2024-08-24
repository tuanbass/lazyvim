-- vim.g.sonokai_style = "maia"
-- need
vim.g.edge_style = "aura"
return {
  { "NTBBloodbath/doom-one.nvim", lazy = true },
  { "sainnhe/sonokai", lazy = true },
  { "sainnhe/edge", lazy = true },
  { "catppuccin/nvim", lazy = true },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "doom-one",
      colorscheme = "sonokai",
      -- colorscheme = "edge",
      -- colorscheme = "catppuccin-macchiato", -- themes
    },
  },
}
