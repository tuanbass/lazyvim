local M = {}
do
  -- Private --------
  -- publics
  M.createCommand = function(commandList)
    for _, value in pairs(commandList) do
      local cmdName = value[1]
      local cmdFunc = value[2]
      vim.api.nvim_create_user_command(cmdName, cmdFunc, {})
    end
  end
end
return M
