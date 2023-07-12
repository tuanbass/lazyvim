return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function(plugin)
      require("utils.cmd").createCommand(plugin.cmds or {})

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

    cmds = {
      {
        "FoldL",
        function(opts)
          local foldlvel = opts.args
          if foldlvel == "" then
            foldlvel = vim.opt.foldlevelstart.get(vim.opt.foldlevelstart) -- Litle ugly but works
          end
          vim.cmd("set foldlevel=" .. foldlvel)
        end,
        { nargs = "*" },
      },
      {
        "Fold",
        function(opts)
          local foldlvel = opts.args
          if foldlvel == "" then
            foldlvel = "2"
          end
          print("Fold: " .. vim.inspect(foldlvel))
          vim.cmd("set foldlevelstart=" .. foldlvel)
          vim.cmd("set foldlevel=" .. foldlvel)
        end,
        { nargs = "*" },
      },
    },

    keys = {
      { "z1", "<cmd>FoldL 1<cr>", desc = "FoldL 1" },
      { "z2", "<cmd>FoldL 2<cr>", desc = "FoldL 2" },
      { "z3", "<cmd>FoldL 3<cr>", desc = "FoldL 3" },
      { "z4", "<cmd>FoldL 4<cr>", desc = "FoldL 4" },
      { "z9", "<cmd>FoldL 9<cr>", desc = "FoldL 9" },
    },
  },
}
