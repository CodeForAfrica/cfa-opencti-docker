.PHONY: deploy-stack

STACK_NAME ?= cfa_opencti
COMPOSE_FILE?= docker-compose.yml

deploy-stack:
	@export $$(cat .env | xargs) && \
	docker stack deploy -c $(COMPOSE_FILE) $(STACK_NAME)

remove-stack:
	docker stack rm $(STACK_NAME)