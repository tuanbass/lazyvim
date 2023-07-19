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
})
