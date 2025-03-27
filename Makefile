.PHONY: deploy remove build

STACK_NAME?=nginx-opencti
COMPOSE_FILE?=docker-compose.yml
NGINX_VERSION?=1.27.0 #based off Nginx docker  version

# build Nginx image & push to dockerhub
build:
	docker buildx build -t codeforafrica/$(STACK_NAME):$(NGINX_VERSION) --file nginx/Dockerfile nginx/ --push

# deploy openCTI stack
deploy:
	@export $$(cat .env | xargs) && \
	docker stack deploy -c $(COMPOSE_FILE) $(STACK_NAME)

# remove stack
remove:
	docker stack rm $(STACK_NAME)
