.PHONY: deploy-stack remove-stack build-nginx

STACK_NAME ?= cfa_opencti
COMPOSE_FILE?= docker-compose.yml
NGINX_TAG?=0.0.1

build-nginx:
	docker buildx build --platform linux/amd64 -t codeforafrica/cfa-opencti:$(NGINX_TAG) --file nginx/Dockerfile nginx/ --push

deploy-stack:
	@export $$(cat .env | xargs) && \
	docker stack deploy -c $(COMPOSE_FILE) $(STACK_NAME)

remove-stack:
	docker stack rm $(STACK_NAME)
