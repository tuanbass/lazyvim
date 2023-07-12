local M = {}
do
  -- Private --------
  -- publics
  M.createCommand = function(commandList)
    for _, value in pairs(commandList) do
      local cmdName = value[1]
      local cmdFunc = value[2]
      local param = value[3] or {}
      vim.api.nvim_create_user_command(cmdName, cmdFunc, param)
    end
  end
end
return M
