-- Mini util that already available in default setup
--   comment
--   pair
--   ai
-- util that replaced by flit (yes, seem flit is beter)
--   jump
--   jump2d
return {
  { "echasnovski/mini.basics" },
  {
    "echasnovski/mini.surround",
    -- config = function()
    --   require("mini.surround").setup()
    -- end,
    opts = {
      mappings = {
        add = "sa", -- Add surrounding in Normal and Visual modes
        delete = "sd", -- Delete surrounding
        -- find = "sf", -- Find surrounding (to the right)
        -- find_left = "sF", -- Find surrounding (to the left)
        -- highlight = "sh", -- Highlight surrounding
        replace = "sr", -- Replace surrounding
        update_n_lines = "sn", -- Update `n_lines`
      },
    },
  },
  {
    "echasnovski/mini.bracketed",
    -- config = function()
    --   require("mini.bracketed").setup()
    -- end,
  },
  {
    "echasnovski/mini.indentscope",
    opts = { -- no need to use config function, opts will be merged with default opts and pass to the setup function
      draw = {
        animation = require("mini.indentscope").gen_animation.none(),
      },
    },
  },
}
