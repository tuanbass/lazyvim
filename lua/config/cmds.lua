-- It's load in the end of loading process
-- print("create command here")

require("utils.cmd").createCommand({
  {
    "LazyAutoreload",
    function(opts)
      local state = opts.args
      if state == "" then
        print("Autoreload state:", vim.g.lazy_auto_reload)
        return
      end

      vim.g.lazy_auto_reload = state == "on" or state == "1"
      if vim.g.lazy_auto_reload then
        vim.notify("Autoreload enabled !!!")
        require("lazy.manage.reloader").enable()
      else
        require("lazy.manage.reloader").disable()
        vim.notify("Autoreload disabled !!!")
      end
    end,
    { nargs = "*" },
  },
  {
    "CopyPathFull",
    "let @+ = expand('%:p') | echo 'copied to clipboard: '..@+",
  },
  {
    "CopyPathRelative",
    "let @+ = expand('%') | echo 'copied to clipboard: '..@+",
  },
  {
    "CopyDir",
    "let @+ = expand('%:p:h') . '/' | echo 'copied to clipboard: '..@+",
  },
  {
    "CopyDirRelative",
    "let @+ = expand('%:h') . '/' | echo 'copied to clipboard: '..@+",
  },
  {
    "BufCleanContent",
    function()
      local buf = vim.fn.bufnr()
      if buf ~= -1 then
        local mod = vim.api.nvim_get_option_value("modifiable", { buf = buf })
        vim.api.nvim_set_option_value("modifiable", true, { buf = buf })
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
        vim.api.nvim_set_option_value("modifiable", mod, { buf = buf })
      end
    end,
  },
})

-- create some command alias
vim.cmd([[
  cnoreabbrev vterm vs +term
  cnoreabbrev hterm sp +term
]])
