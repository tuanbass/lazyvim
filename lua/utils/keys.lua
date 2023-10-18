local M = {}
do
  -- Private --------
  local function map(mode, lhs, rhs, opts)
    ---@cast keys LazyKeysHandler
    -- do not create the keymap if a lazy keys handler exists
    -- FIXME: Figure out why keys.active cannot detect the registed keymap.
    -- So it's not really a safe_map T_T
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then opts.remap = nil end

    local keys = require("lazy.core.handler").handlers.keys
    -- print("active", vim.inspect(keys.active))
    if not keys or not keys.active[keys.parse({ lhs, mode = mode }).id] then
      vim.keymap.set(mode, lhs, rhs, opts)
    else
      vim.notify("lazy keymap: keys already exists")
    end
  end
  -- publics

  -- Batch create Cmd
  -- params: list of Command to create
  M.safe_map = function(mode, lhs, rhs, opts) map(mode, lhs, rhs, opts) end
end
return M
