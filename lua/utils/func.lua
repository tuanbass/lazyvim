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

M.find = function(t, value)
  for i, v in ipairs(t) do
    if v == value then return i end
  end
  return nil
end

return M
