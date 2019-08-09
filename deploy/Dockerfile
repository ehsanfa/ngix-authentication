FROM openresty/openresty:alpine-fat

RUN apk update && \
	apk add openssl

RUN luarocks install lua-resty-jwt && \
	luarocks install lua-cjson

COPY ./conf.d /etc/nginx/conf.d
COPY ./modules /usr/local/openresty/nginx
COPY ./modules /usr/local/openresty/site/lualib

CMD nginx -g "daemon off;"