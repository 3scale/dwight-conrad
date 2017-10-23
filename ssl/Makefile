
build:
	s2i build . quay.io/3scale/s2i-openresty-centos7:rover ssl-test --incremental --copy

test:
	docker run -it  -v $(PWD)/letsencrypt:/etc/resty-auto-ssl/letsencrypt ssl-test openresty -c /opt/app-root/src/conf/nginx.conf -g 'daemon on;'
