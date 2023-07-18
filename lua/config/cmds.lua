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

      vim.g.lazy_auto_reload = state == "on"
      if vim.g.lazy_auto_reload then
        require("lazy.manage.reloader").enable()
        print("Autoreload enabled !!!")
      else
        require("lazy.manage.reloader").disable()
        print("Autoreload disabled !!!")
      end
    end,
    { nargs = "*" },
  },
  {
    "CopyPathFull",
    "let @+ = expand('%:p')",
  },
  {
    "CopyPathRelative",
    "let @+ = expand('%')",
  },
})
