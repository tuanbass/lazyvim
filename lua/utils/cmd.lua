local M = {}
local lazy_command_group = "LazyCustomAu"
vim.api.nvim_create_augroup(lazy_command_group, { clear = false })
do
  -- Private --------
  -- publics

  -- Batch create Cmd
  -- params: list of Command to create
  M.createCommand = function(commandList)
    for _, value in pairs(commandList) do
      local cmdName = value[1]
      local cmdFunc = value[2]
      local param = value[3] or {}
      vim.api.nvim_create_user_command(cmdName, cmdFunc, param)
    end
  end

  -- Batch create AutoCmd
  -- params: list of AutoCmd to create
  M.createAutoCommand = function(commandList)
    for _, value in pairs(commandList) do
      local event = value[1]
      local pattern = value[2]
      local action = value[3]
      local opts = value[4] or {}

      local o = {
        pattern = pattern,
        group = lazy_command_group,
      }
      opts = vim.tbl_extend("force", o, opts)

      if type(action) == "function" then
        opts.callback = action
      else
        opts.command = action
      end

      vim.api.nvim_create_autocmd(event, opts)
    end
  end
end
return M
