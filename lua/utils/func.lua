local uv = require("luv")
M = {}
M.setTimeout = function(callback, ms)
  local timer = uv.new_timer()
  timer:start(ms, 0, function()
    timer:close()
    callback()
  end)
  return timer
end

return M
