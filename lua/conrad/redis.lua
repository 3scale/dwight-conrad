local redis = {}
local resty_redis = require "resty.redis"

local keepalive = 10000 -- 10 seconds
local pool_size = 100
local timeout   = 1000 -- 1 second

redis.connect = function()
  if ngx.ctx.redis then return ngx.ctx.redis end

  local red = resty_redis:new()

  red:set_timeout(timeout)

  local ok, err = red:connect("127.0.0.1", 6379)

  if not ok then
    ngx.log(ngx.ERR, "failed to connect to redis: ", err)
    return ngx.exit(ngx.HTTP_SERVICE_UNAVAILABLE)
  end

  ngx.ctx.redis = red

  return red
end

redis.disconnect = function(red)
  ngx.ctx.redis = nil
  red:set_keepalive(keepalive, pool_size)
end

return redis
