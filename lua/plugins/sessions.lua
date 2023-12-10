local session_path = vim.fn.stdpath("data") .. "/sessions/"

return {
  {
    "JoseConseco/telescope_sessions_picker.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "echasnovski/mini.sessions" },
    lazy = false,
    config = function(plugin)
      require("mini.sessions").setup({
        autoread = true,
        autowrite = true,
        -- file = "Session.vim",
        directory = session_path,
      })
      require("telescope").setup({
        -- your existing tele config
        extensions = {
          sessions_picker = {
            sessions_dir = session_path,
          },
          -- other tele extensions configs
        },
      })
      require("telescope").load_extension("sessions_picker")

      -- create some custom commands
      require("utils.cmd").createCommand(plugin.cmds or {})
    end,
    keys = {
      { "<leader>S", "", desc = "Sessions" },
      { "<leader>Sl", "<cmd>Telescope sessions_picker<cr>", desc = "Sessions load" },
      { "<leader>Ss", "<cmd>SessionSave<cr>", desc = "Sessions create" },
    },

    cmds = {
      {
        "SessionSave", -- :MkSession <session-name> , to create a session. Buffers in this session will be auto tracked from now on
        function(opts)
          local sess_name = opts.args
          if sess_name == nil or sess_name == "" then
            local current_folder = vim.fn.getcwd()
            sess_name = vim.fn.fnamemodify(current_folder, ":t")
          end
          require("mini.sessions").write(sess_name)
        end,
        { nargs = "?" }, -- 0 or 1 args
      },
    },
  },
  -- yes, another session manager
  -- {
  --   "mrquantumcodes/retrospect.nvim",
  --   lazy = false,
  --   config = function()
  --     local retrospect = require("retrospect")
  --     -- retrospect.setup({
  --     --   saveKey = "<leader>\\", -- The shortcut to save the session, default is leader+backslash(\)
  --     --   loadKey = "<leader><BS>", -- The shortcut to load the session
  --     --   style = "default", -- or "modern", if you have nui.nvim and dressing.nvim
  --     -- })
  --   end,
  --   -- cmd = { "SessionLoad", function() require("retrospect").RestoreSession() end, desc = "Load Session" },
  -- },
}
