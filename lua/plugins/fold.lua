function changeFoldLevel(level)
  if level < 0 then
    level = 0
  end

  vim.w.ufo_fold_level = level
  -- print("fold to level:", level)
  require("ufo").closeFoldsWith(level)
end

return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    lazy = false,
    config = function(plugin)
      -- print("config ufo")
      require("utils.cmd").createCommand(plugin.cmds or {})
      require("utils.cmd").createAutoCommand(plugin.auto_cmds)

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
    auto_cmds = { -- set default foldlevel when open window

      {
        { "WinNew", "VimEnter" },
        "*",
        function()
          vim.w.ufo_fold_level = vim.g.ufo_fold_level_start or 3
          changeFoldLevel(vim.w.ufo_fold_level)
          -- TODO: still an issue when first time load a window, the start fold level not work
          -- possibly because the plugin is not loaded yet
          -- require("utils.func").setTimeout(function()
          --   vim.schedule(function()
          --     print("set fold level:", vim.w.ufo_fold_level)
          --     -- changeFoldLevel(vim.w.ufo_fold_level)
          --     vim.cmd(":FoldL<CR>")
          --   end)
          -- end, 1000)
        end,
      },
    },

    cmds = {
      {
        "FoldL",
        function(opts)
          local foldlvel = opts.args
          if foldlvel == "" then
            foldlvel = vim.g.ufo_fold_level_start - 1
          end
          changeFoldLevel(tonumber(foldlvel))
        end,
        { nargs = "*" },
      },
    },

    keys = {
      { "z0", "<cmd>FoldL<cr>", desc = "FoldL default " },
      { "z1", "<cmd>FoldL 0<cr>", desc = "FoldL 1" },
      { "z2", "<cmd>FoldL 1<cr>", desc = "FoldL 2" },
      { "z3", "<cmd>FoldL 2<cr>", desc = "FoldL 3" },
      { "z4", "<cmd>FoldL 3<cr>", desc = "FoldL 4" },
      { "z9", "<cmd>FoldL 8<cr>", desc = "FoldL 9" },
      {
        "zM",
        function()
          changeFoldLevel(0)
        end,
        desc = "fold close all",
      },
      {
        "zR",
        function()
          changeFoldLevel(9)
        end,
        desc = "fold open all",
      },
      {
        "zm",
        function()
          changeFoldLevel(vim.w.ufo_fold_level - 1)
        end,
        desc = "fold more",
      },
      {
        "zr",
        function()
          changeFoldLevel(vim.w.ufo_fold_level + 1)
        end,
        desc = "fold less",
      },
    },
  },
}
