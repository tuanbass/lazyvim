return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function(opts)
      require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,

        -- TODO: Need to check why preview doesnot work
        preview = {
          mappings = {
            scrollB = "h",
            scrollF = "l",
            scrollU = "k",
            scrollD = "j",
            scrollE = "<C-E>",
            scrollY = "<C-Y>",
            close = "q",
            switch = "<C-Tab>",
            trace = "<CR>",
          },
          win_config = {
            maxheight = 60,
          },
        },
      })
    end,
  },
}
