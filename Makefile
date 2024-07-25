.PHONY: deploy remove build

STACK_NAME ?= cfa_opencti
COMPOSE_FILE?= docker-compose.yml
NGINX_VERSION?=1.26.0 #based off Nginx docker  version

# build Nginx image & push to dockerhub
build:
	docker buildx build --platform linux/amd64 -t codeforafrica/cfa-opencti-nginx:$(NGINX_VERSION) --file nginx/Dockerfile nginx/ --push

# deploy openCTI stack
deploy:
	@export $$(cat .env | xargs) && \
	docker stack deploy -c $(COMPOSE_FILE) $(STACK_NAME)

# remove stack
remove:
	docker stack rm $(STACK_NAME)
