local jwt = require "resty.jwt"
local authentication_token = ngx.var.http_authorization
local secret = require "jwt-secret"

if jwt:verify(secret, authentication_token).valid ~= true then
	return ngx.exit(ngx.HTTP_FORBIDDEN)
end
