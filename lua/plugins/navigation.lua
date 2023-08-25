local Flash = require("flash")
local function format(opts)
  -- always show first and second label
  return {
    { opts.match.label1, "FlashMatch" },
    { opts.match.label2, "FlashLabel" },
  }
end

local jumpByPattern = function(pattern)
  --@param opts Flash.Format

  Flash.jump({
    search = { mode = "search" },
    label = {
      after = false,
      before = { 0, 0 },
      uppercase = false,
      format = format,
    },
    -- pattern = [[\<]],
    pattern = pattern,
    action = function(match, state)
      state:hide()
      Flash.jump({
        search = { max_length = 0 },
        highlight = { matches = false },
        label = { format = format },
        matcher = function(win)
          -- limit matches to the current label
          return vim.tbl_filter(function(m) return m.label == match.label and m.win == win end, state.results)
        end,
        labeler = function(matches)
          for _, m in ipairs(matches) do
            m.label = m.label2 -- use the second label
          end
        end,
      })
    end,
    labeler = function(matches, state)
      local labels = state:labels()
      for m, match in ipairs(matches) do
        match.label = labels[math.floor((m - 1) / #labels) + 1]
        -- first and second label
        match.label1 = match.label
        match.label2 = labels[(m - 1) % #labels + 1]
      end
    end,
  })
end

return {

  { -- j/k to escape
    "max397574/better-escape.nvim",
    cond = function() return vim.g.vscode ~= 1 end,
    config = function()
      require("better_escape").setup({
        mapping = { "jk", "jj", "kj", "kk" }, -- a table with mappings to use
        keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
      })
    end,
  },

  { -- overwrite settings in the Lazy base
    "folke/flash.nvim",
    lazy = false,
    event = "VeryLazy",
    vscode = true,
    ---@type Flash.Config
    opts = {
      label = { exclude = "" }, -- add more available char for the label
      search = { multi_window = false },
      modes = {
        char = {
          jump_labels = true,
          -- label = { exclude = "hjkliardc" },
          label = { exclude = "" }, -- add more available char for the label
          -- enabled = false,
        },
      },
    },
    config = function(p)
      require("flash").setup(p.opts)
      --   local Config = require("flash.config")
      --   local Char = require("flash.plugins.char")
      --   for _, motion in ipairs({ "f", "t", "F", "T" }) do
      --     vim.keymap.set({ "n", "x", "o" }, motion, function()
      --       print("haha")
      --       require("flash").jump(Config.get({
      --         mode = "char",
      --         search = {
      --           mode = Char.mode(motion),
      --           label = { "abcd", exclude = "" }, -- add more available char for the label
      --           max_length = 2,
      --         },
      --       }, Char.motions[motion]))
      --     end)
      --   end
    end,
    -- stylua: ignore
    keys = {

      { "*", mode = { "n", "x", "o" }, function() require("flash").jump({  pattern = vim.fn.expand("<cword>") }) end, desc = "Flash" }, -- search word under cursor
      { "gw", mode = { "n", "x", "o" }, function() jumpByPattern([[\<]]) end, desc = "JumpWord" },
      { "ga", mode = { "n", "o", "x" }, function() jumpByPattern() end, desc = "JumpChar" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      -- {
      --   -- Show diagnostics at target, without changing cursor position
      --   "<leader>cD", mode = { "n" }, function()
      --     require("flash").jump({
      --       action = function(match, state)
      --         vim.api.nvim_win_call(match.win, function()
      --           vim.api.nvim_win_set_cursor(match.win, match.pos)
      --           vim.diagnostic.open_float()
      --         end)
      --         state:restore()
      --       end,
      --     })
      -- end, desc = "Dianostics (no curs)" },

      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
}

-- There are some preconfigured shortcuts that are very handy:
--     { "za", desc = "Toggle fold" },
--     { "<leader>ss", desc = "Navigate all function" },
--     { "gd", desc = "Go to definition" },
--

-- also mapped j to gj. (difference in the wrap mode: gj go down by screen line, j go down by logical line)
