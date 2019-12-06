local cjson = require "cjson"

local userId = ngx.req.get_headers()["X-Ftweb-Userid"]
if userId == nil or userId == "" then
	ngx.say("{\"code\": 401, \"msg\":\"UNAUTHORIZED(0)\" }")
	return
end


local sessionId = ngx.req.get_headers()["X-Ftweb-Sessionid"]
if sessionId == nil or sessionId == "" then
	ngx.say("{\"code\": 401, \"msg\":\"UNAUTHORIZED(1)\" }")
	return
end


local signature = ngx.req.get_headers()["X-Ftweb-Signature"]
if signature == nil or signature == "" then
	ngx.say("{\"code\": 401, \"msg\":\"UNAUTHORIZED(2)\" }")
	return
end


ngx.log(ngx.ERR,userId)
ngx.log(ngx.ERR,sessionId)
ngx.log(ngx.ERR,signature)

ngx.log(ngx.ERR, ngx.var.request_uri)

-- 验证签名
pstr = sessionId.."要加的盐"..userId
ngx.log(ngx.ERR,pstr)
local pstrmd5 = ngx.md5(pstr)
ngx.log(ngx.ERR,pstrmd5)


if pstrmd5 ~= signature then
	ngx.log(ngx.ERR, " ==signature error==, ["..pstr.."], md5:"..pstrmd5..", post signature:"..signature)
	ngx.say("{\"code\": 401, \"msg\":\"UNAUTHORIZED(5)\" }")
	return
end
ngx.log(ngx.ERR, "签名验证通过")

-- 验证redis判断是否登录失效
local redis = require "resty.redis"
local red = redis:new()
red:set_timeout(1000)
local ok, err = red:connect('127.0.0.1', '6379')
if not ok then
 	ngx.log(ngx.ERR, "redis 连接失败")
 	ngx.say('{"code":500, "msg":"服务器错误(red err:1)"}')
	return
end

--查询redis里session登记
local userInfo, err = red:hmget("key"..userId,'field')
ngx.log(ngx.ERR, "key"..userId)
ngx.log(ngx.ERR,err)
ngx.log(ngx.ERR,table.getn(userInfo))

 if type(userInfo)=="boolean" and userInfo == false then
	ngx.log(ngx.ERR, "key"..userId)
	ngx.say("{\"code\": 104, \"msg\":\"INVALID_SESSIONID(2.1).\" }")
	return
end

if(userInfo[1]==nil or userInfo[1]~=sessionId)
	ngx.log(ngx.ERR, "key"..userId)
	ngx.say("{\"code\": 104, \"msg\":\"INVALID_SESSIONID(2.2).\" }")
end





