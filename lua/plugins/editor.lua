return {
  -- enhanced yank
  {
    "gbprod/yanky.nvim",
    -- config = function(opts)
    --   require("yanky").setup(opts)
    -- end,
    keys = {
      {
        "gy",
        function()
          require("telescope").extensions.yank_history.yank_history({})
        end,
        desc = "Open Yank History",
      },
      -- other default shortcut can be found in $HOME/.local/share/nvim_plugins/lazyvim/lazy/LazyVim/lua/lazyvim/plugins/extras/coding/yanky.lua
    },
  },
  -- enhanced subtitude
  {
    "gbprod/substitute.nvim",
    config = function(opts)
      require("substitute").setup({
        highlight_substituted_text = {
          enabled = true,
          timer = 1000,
        },
      })
      -- TODO: Not work yet
      vim.keymap.set("n", "s", require("substitute").operator, { noremap = true })
      vim.keymap.set("n", "ss", require("substitute").line, { noremap = true })
      vim.keymap.set("n", "S", require("substitute").eol, { noremap = true })
      vim.keymap.set("x", "s", require("substitute").visual, { noremap = true })

      -- range substitute
      vim.keymap.set("n", "<leader>s", require("substitute.range").operator, { noremap = true })
      vim.keymap.set("x", "<leader>s", require("substitute.range").visual, { noremap = true })

      vim.keymap.set("n", "<leader>ss", function()
        -- tricky: pass a empty table to subject to avoid nil exception
        require("substitute.range").word({ subject = {} })
      end, { noremap = true })
    end,
    enabled = false,
  },

  -- command help to close multiple buffers
  {
    "kazhala/close-buffers.nvim",
    config = function(plugin)
      local opts = plugin.opts
      require("close_buffers").setup(opts)
      local cmds = plugin.cmds or {}
      for _, value in pairs(cmds) do
        local cmdName = value[1]
        local cmdFunc = value[2]
        vim.api.nvim_create_user_command(cmdName, cmdFunc, {})
      end
    end,

    opts = {
      preserve_window_layout = { "this", "other", "all" },
      next_buffer_cmd = function(windows)
        require("bufferline").cycle(1)
        local bufnr = vim.api.nvim_get_current_buf()

        for _, window in ipairs(windows) do
          vim.api.nvim_win_set_buf(window, bufnr)
        end
      end,
    },

    -- define some custom command, and register them in the config function
    cmds = {
      -- command! BufferKillForce lua require('lvim.core.bufferline').buf_kill('bd', nil, true)
      {
        "BD1this",
        function()
          vim.cmd("BDelete this") -- BDelete this
          -- vim.cmd(".,$-bdelete")
          -- require('close_buffers').delete({ type = 'other' })
        end,
      },
      {
        "BDReopen",
        function()
          vim.cmd("BDelete this") -- BDelete this
          vim.cmd("edit #") -- reopen last file
          -- vim.cmd(".,$-bdelete")
          -- require('close_buffers').delete({ type = 'other' })
        end,
      },
      {
        "BDthisForce",
        function()
          vim.cmd("BDelete! this")
          -- vim.cmd(".,$-bdelete")
          -- require('close_buffers').delete({ type = 'other' })
        end,
      },
      {
        "BD2Other",
        function()
          -- vim.cmd("%bdelete")
          vim.cmd("BufferLineCloseLeft")
          vim.cmd("BufferLineCloseRight")
        end,
      },
      {
        "BD3All",
        function()
          -- vim.cmd("%bdelete")
          vim.cmd("BD2Other")
          vim.cmd("BD1this")
        end,
      },

      -- {
      --   "ToggleScratchPad",
      --   function()
      --     print("type dsp in normal mode to toggle Scratpad")
      --   end,
      -- },
    },
  },
}
