local conrad = require('conrad.conrad')

local key = ngx.var.dwight
local server = conrad:lookup(key)

ngx.var.server = server

conrad:exit()
