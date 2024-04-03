.PHONY: deploy-stack

STACK_NAME ?= cfa_opencti
COMPOSE_FILE?= docker-compose.yml

deploy:
	@export $$(cat .env | xargs) && \
	docker stack deploy -c docker-compose.yml $(STACK_NAME)
