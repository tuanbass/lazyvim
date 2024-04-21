-- let g:gtd#default_action = 'inbox'
-- vim.g.gtd_default_action = "inbox"
-- vim.g["gtd#dir"] = "~/notes/"
local function bind_key_todo(keybinds)
  local wk = require("which-key")
  -- wk.register({ d = { name = "Debug hydra" } }, { prefix = "<leader>d" })
  wk.register({ o = { "+Neorg" } }, { prefix = "<localleader>" }) -- virtual sub menu
  wk.register({ t = { "+Todo" } }, { prefix = "<localleader>o" }) -- virtual sub menu

  keybinds.remap_key("norg", "n", "<LocalLeader>td", "<LocalLeader>otd") -- Done
  keybinds.remap_key("norg", "n", "<LocalLeader>ta", "<LocalLeader>ota") -- Ambiguous
  keybinds.remap_key("norg", "n", "<LocalLeader>tc", "<LocalLeader>otc") -- Cancel
  keybinds.remap_key("norg", "n", "<LocalLeader>th", "<LocalLeader>oth") -- Hold
  keybinds.remap_key("norg", "n", "<LocalLeader>tp", "<LocalLeader>otp") -- Pending
  keybinds.remap_key("norg", "n", "<LocalLeader>tr", "<LocalLeader>otr") -- Recurent
  keybinds.remap_key("norg", "n", "<LocalLeader>ti", "<LocalLeader>oti") -- Important
  keybinds.remap_key("norg", "n", "<LocalLeader>tu", "<LocalLeader>otu") -- Undone
  keybinds.remap_key("norg", "n", "<LocalLeader>li", "<LocalLeader>oli") -- Undone
  keybinds.remap_key("norg", "n", "<LocalLeader>lt", "<LocalLeader>olt") -- Undone
  keybinds.remap_key("norg", "n", "<C-Space>", "<LocalLeader>on") -- Next
  keybinds.remap_key("norg", "i", "<M-CR>", "<C-CR>") -- new item
  keybinds.remap_event("norg", "p", "<LocalLeader>oN", "core.qol.todo_items.todo.task_cycle_reverse") -- Cycle Task Reverse
  wk.register({ p = { "Cycle Prev" } }, { prefix = "<localleader>o" }) -- virtual sub menu

  -- keybinds.map_event_to_mode("norg", {
  --   n = {
  --     { "<LocalLeader>oN", "core.qol.todo_items.todo.task_cycle_reverse", opts = { desc = "Cycle Task Reverse" } },
  --   },
  -- })
end
local function bind_key_notes(keybinds)
  -- navigate beetween heedings / links

  local wk = require("which-key")
  keybinds.remap_event("norg", "n", "<LocalLeader>oN", "core.dirman.new.note") --
  wk.register({ N = { "New Note" } }, { prefix = "<localleader>o" }) -- virtual sub menu

  keybinds.remap_event("norg", "n", "<LocalLeader>h", "core.integrations.treesitter.next.heading") --
  wk.register({ h = { "Heading next" } }, { prefix = "<localleader>" }) -- virtual sub menu

  keybinds.remap_event("norg", "n", "<LocalLeader>H", "core.integrations.treesitter.previous.heading") --
  wk.register({ H = { "Heading prev" } }, { prefix = "<localleader>" }) -- virtual sub menu

  keybinds.remap_event("norg", "n", "<LocalLeader>ol", "core.integrations.treesitter.next.link") --
  wk.register({ l = { "Link next>" } }, { prefix = "<localleader>o" }) -- virtual sub menu

  keybinds.remap_event("norg", "n", "<LocalLeader>oL", "core.integrations.treesitter.previous.link") --
  wk.register({ L = { "Link prev" } }, { prefix = "<localleader>o" }) -- virtual sub menu

  -- view code block
  keybinds.remap_event("norg", "n", "<LocalLeader>oc", "core.looking-glass.magnify-code-block") --
  wk.register({ c = { "Edit code block" } }, { prefix = "<localleader>o" }) -- virtual sub menu
end

local function bind_key(keybinds)
  print("Loading custom key binding for neoorg", vim.inspect(keybinds))
  bind_key_todo(keybinds)
  bind_key_notes(keybinds)
end

return {
  -- TODO: Temporary disable neorg
  -- {
  --   "nvim-neorg/neorg",
  --   build = ":Neorg sync-parsers",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require("neorg").setup({
  --       load = {
  --         ["core.concealer"] = {}, -- Adds pretty icons to your documents
  --         ["core.qol.todo_items"] = {
  --           config = {
  --             create_todo_parents = true,
  --           },
  --         }, -- Adds pretty icons to your documents
  --         ["core.dirman"] = { -- Manages Neorg workspaces
  --           config = {
  --             workspaces = {
  --               notes = "~/notes",
  --             },
  --             default_workspace = "notes",
  --           },
  --         },
  --         ["core.keybinds"] = {
  --           config = {
  --             default_keybinds = true,
  --             hook = bind_key,
  --           },
  --         },
  --         ["core.defaults"] = {}, -- Loads default behaviour
  --         ["core.export"] = {}, -- Loads default behaviour
  --         ["core.summary"] = {}, -- Loads default behaviour
  --       },
  --     })
  --   end,
  -- },
}
