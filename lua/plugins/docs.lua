return {
  {
    "danymat/neogen",
    -- commit = "0958aeffcddf46e57785c3026be934816b4f39d2",
    -- keys = { "<leader>cg" },
    keys = {
      {
        "<leader>cg",
        function()
          require("neogen").generate()
        end,
        desc = "Neogen",
      },
    },
    config = function()
      require("neogen").setup()
    end,
    cmd = "Neogen",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    -- version = "*",
  },
}
