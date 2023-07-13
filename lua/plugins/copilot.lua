return {
  "zbirenbaum/copilot.lua",

  config = function(plugin)
    require("copilot").setup(plugin.opts)
  end,

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
}
