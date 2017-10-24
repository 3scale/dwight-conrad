
export PROXY_ENDPOINT ?= http://echo-api.3scale.net
export STORAGE_DIR ?= $(PWD)/tmp
export LOG_LEVEL ?= info

build:
	s2i build . quay.io/3scale/s2i-openresty-centos7:rover ssl-test --incremental --copy

docker-run:
	docker run -it -p 8080:8080 -p 443:8443 -e LOG_LEVEL=debug -e PROXY_ENDPOINT=http://echo-api.3scale.net -v $(PWD)/resty-auto-ssl:/etc/resty-auto-ssl ssl-test

run:
	rover exec .s2i/bin/run

test:
	docker run -it  -v $(PWD)/letsencrypt:/etc/resty-auto-ssl/letsencrypt ssl-test openresty -c /opt/app-root/src/conf/nginx.conf -g 'daemon on;'
