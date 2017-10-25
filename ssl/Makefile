
export PROXY_ENDPOINT ?= http://echo-api.3scale.net
export STORAGE_DIR ?= $(PWD)/tmp
export LOG_LEVEL ?= info

BUILDER_IMAGE ?= quay.io/3scale/s2i-openresty-centos7:rover
IMAGE_NAME ?= auto-ssl-candidate
REGISTRY ?= quay.io/3scale

REMOTE_IMAGE_NAME ?= $(REGISTRY)/$(IMAGE_NAME)

build:
	s2i build . $(BUILDER_IMAGE) $(IMAGE_NAME) --incremental --copy

docker-run:
	docker run -it -p 8080:8080 -p 443:8443 -e LOG_LEVEL=debug -e PROXY_ENDPOINT=http://echo-api.3scale.net -v $(PWD)/resty-auto-ssl:/etc/resty-auto-ssl $(IMAGE_NAME)

run:
	rover exec openresty -c $(PWD)/conf/nginx.conf -g 'daemon off; error_log stderr $(LOG_LEVEL);'

test:
	docker run -it -e PROXY_ENDPOINT=http://echo-api.3scale.net -v $(PWD)/resty-auto-ssl:/etc/resty-auto-ssl $(IMAGE_NAME) openresty -c /opt/app-root/src/conf/nginx.conf -g 'daemon on;'

push:
	docker tag $(IMAGE_NAME) $(REMOTE_IMAGE_NAME)
	docker push $(REMOTE_IMAGE_NAME)

release:
	$(MAKE) build push IMAGE_NAME=dwight:ssl
