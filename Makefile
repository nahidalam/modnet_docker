.PHONY: help, dev-start, dev-stop


## Ensure this is the same name as in docker-compose.yml file
CONTAINER_NAME="modnet_develop_${USER}"
PROJECT=modnet
PROJ_DIR="/mnt/modnet"
VERSION_FILE:=VERSION
COMPOSE_FILE=docker/docker-compose.yml
TAG:=$(shell cat ${VERSION_FILE})

# takes advantage of the makefile structure (command; ## documentation)
# to generate help
help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

dev-start: ## Primary make command for devs, spins up containers
	docker-compose -f $(COMPOSE_FILE) --project-name $(PROJECT) up -d --no-recreate develop

dev-stop: ## Spin down active containers
	docker-compose -f $(COMPOSE_FILE) --project-name $(PROJECT) down

# Useful when Dockerfile/requirements are updated)
dev-rebuild: ## Rebuild images for dev containers
	docker-compose -f $(COMPOSE_FILE) --project-name $(PROJECT) up -d --build

nb: ## Opens Jupyterlab in the browser
	docker port $(CONTAINER_NAME) | grep 8888 | awk -F ":" '{print "http://localhost:"$$2}' | xargs open

bash: dev-start ## Provides an interactive bash shell in the container
	docker exec -it $(CONTAINER_NAME) bash

ipython: dev-start ## Provides an interactive ipython prompt
	docker exec -it $(CONTAINER_NAME) ipython

clean: ## Clean out temp/compiled python files
	find . -name __pycache__ -delete
	find . -name "*.pyc" -delete
