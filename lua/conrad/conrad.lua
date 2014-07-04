local conrad = {}

local redis = require 'conrad.redis'

function conrad:lookup(key)

  local red = redis.connect()
  local server, err = red:get(key)
  redis.disconnect(red)

  if server == ngx.null then
    return "default"
  end

  return server

end

function conrad:exit(status)
  if status then
    ngx.status = status
  end

  if ngx.status > 0 then
    ngx.exit(ngx.status)
  end
end

return conrad
