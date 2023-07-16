-- we overwrite behavior of neotree plugin here
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = require("plugins.explorer.key_mapping").keymap,
      },
    },
  },
}
