local session_path = vim.fn.stdpath("data") .. "/sessions/"

return {
  {
    "JoseConseco/telescope_sessions_picker.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "echasnovski/mini.sessions" },
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
    keys = { { "<leader>fs", "<cmd>Telescope sessions_picker<cr>", desc = "Sessions" } },

    cmds = {
      {
        "MkSession", -- :MkSession <session-name> , to create a session. Buffers in this session will be auto tracked from now on
        function(opts)
          local sess_name = opts.args
          if sess_name == nil or sess_name == "" then sess_name = "Session.vim" end
          require("mini.sessions").write(sess_name)
        end,
        { nargs = "?" }, -- 0 or 1 args
      },
    },
  },
}
