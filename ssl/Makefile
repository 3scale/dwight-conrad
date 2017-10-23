
build:
	s2i build . quay.io/3scale/s2i-openresty-centos7:rover ssl-test --incremental --copy

run:
	docker run -it -p 8080:8080 -p 443:8443 -v $(PWD)/resty-auto-ssl:/etc/resty-auto-ssl ssl-test openresty -c /opt/app-root/src/conf/nginx.conf -g 'daemon off; error_log stderr debug;'
test:
	docker run -it  -v $(PWD)/letsencrypt:/etc/resty-auto-ssl/letsencrypt ssl-test openresty -c /opt/app-root/src/conf/nginx.conf -g 'daemon on;'
