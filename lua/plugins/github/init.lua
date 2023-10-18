local auto_cmds = {
  {
    "FileType",
    "octo",
    function()
      local wk = require("which-key")
      wk.register({ r = { "+Review" } }, { prefix = "<localleader>" }) -- virtual sub menu

      require("utils.keys").safe_map("n", "<localleader>rr", "<cmd>Octo thread resolve <cr>", { desc = "Resolve", buffer = vim.fn.bufnr(), silent = true })
      -- require("utils.keys").safe_map("n", "<localleader>r", "<cmd>Octo thread resolve <cr>", { desc = "Resolve", buffer = vim.fn.bufnr(), silent = true })
    end,
  },
}
require("utils.cmd").createAutoCommand(auto_cmds or {})

octo_menu = function()
  --
  local buf_num = vim.fn.bufnr()
  local handler
  if octo_buffers[buf_num] then
    local picker = require("plugins.github.picker")
    -- print("in a octo buffer")
    handler = picker.show
  else
    -- print("not in a octo buffer")
    handler = require("octo.commands").actions
  end
  handler()
end

return {
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function(plugin)
      require("octo").setup({ default_remote = { "origin", "upstream" } })
      require("utils.cmd").createCommand(plugin.custom_cmds or {})
      require("utils.cmd").createAutoCommand(plugin.auto_cmds or {})
    end,
    cmd = { "Octo", "GithubMenu" }, -- load plugin in some command
    custom_cmds = { --create come custom command

      {
        "GithubMenu",
        function()
          -- local github = require("plugins.github")
          octo_menu()
        end,
      },
    },
    keys = { { "<leader>go", "<cmd>GithubMenu<cr>", desc = "Github" } },
    auto_cmds = {
      {
        "FileType",
        "octo",
        function()
          -- vim.cmd([[ map <silent> <buffer> g? :GithubMenu<CR> ]])
          require("utils.keys").safe_map("n", "<leader>go", "<cmd>GithubMenu<cr>", { buffer = vim.fn.bufnr(), silent = true })
        end,
      },
    },
  },
}

-- TODO: Not complete yet
