local conrad = require('conrad.conrad')

local key = ngx.var.http_host
local server = conrad:lookup(key)

ngx.var.server = server

conrad:exit()
