local jwt = require "resty.jwt"
local secret = require "jwt-secret"
local authenticator = "/authenticate"
local json = require 'cjson'

ngx.req.read_body()
local request_options = {}
request_options["method"] = ngx.HTTP_POST
request_options["always_forward_body"] = true
local res = ngx.location.capture(
	authenticator,
	request_options
)
if res.status ~= 200 then
	ngx.status = res.status  
	return ngx.say(res.body)
else
	local resp_data = json.decode(res.body)
	local jwt_token = jwt:sign(
	    secret,
	    {
	        header={typ="JWT", alg="HS256"},
	        payload=resp_data
	    }
	)
	local response = {token = jwt_token}
	return ngx.say(json.encode(response))
end

