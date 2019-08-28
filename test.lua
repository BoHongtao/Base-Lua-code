--local config = require "config"
local dkjson = require("dkjson")

--local welcome = 'Hello Nginx,I am lua file,how are you?'
--ngx.say(welcome)

--local log = "hello Nginx,I'm lua log"
--ngx.log(ngx.ERR, "log:"..log)

ngx.log(ngx.ERR, ngx.var.request_uri)

local header = ngx.req.get_headers()['myheader']
ngx.log(ngx.ERR, dkjson.encode(header))
ngx.log(ngx.ERR, dkjson.encode(ngx.req.get_headers()))


