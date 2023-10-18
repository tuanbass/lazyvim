-- We map some short cut on file type
local auto_cmds = {
  {
    "FileType",
    "rust",
    function() require("utils.keys").safe_map("n", "<localleader>r", "<cmd>RustRun<cr>", { buffer = vim.fn.bufnr(), silent = true }) end,
  },
}

require("utils.cmd").createAutoCommand(auto_cmds or {})

return {
  -- {
  --   "simrat39/rust-tools.nvim",
  --   -- enabled = false,
  -- },
}
