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
      require("close_buffers").setup(plugin.opts or {})
      require("utils.cmd").createCommand(plugin.cmds or {})
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

  {
    "terryma/vim-expand-region",
    config = function(plugin)
      -- TODO: Refine the order of expand region
      vim.g.expand_region_text_objects = {
        ["i"] = 0,
        ["i'"] = 0,
        ['i"'] = 0,
        ["iw"] = 0,
        ["i]"] = 1,
        ["a]"] = 1,
        ["i}"] = 1,
        ["a}"] = 1,
        ["i)"] = 1,
        ["a)"] = 1,
        ["iW"] = 0,
        ["it"] = 1,
        ["ii"] = 1, -- inside indent from mini.nvim
        ["ai"] = 1, -- around indent from mini.nvim
        -- ["ib"] = 1,
        -- ["iB"] = 1,
        ["il"] = 0,
        -- ["ip"] = 0,
        -- ["ie"] = 0,
      }

      -- dont know why cannot use "keys" property here for mapping

      vim.cmd([[
            vmap v <Plug>(expand_region_expand)
      ]])
    end,
  },
}
