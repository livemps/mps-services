# Makefile Setup
.PHONY: default all build up down restart logs exec purge
default:all
all: build up

# Makefile config
include .env

# Compose targets
build:
	sudo mkdir -p $(DATA_FOLDER)
	sudo touch $(DATA_FOLDER)/mumble_server_config.ini
	sudo chmod a+rw $(DATA_FOLDER)/mumble_server_config.ini
	docker-compose build
up: build
	docker-compose up -d 
down:
	docker-compose down
restart: build
	docker-compose restart
logs:
	docker logs $(CONTAINER_NAME)
exec:
	docker exec -ti $(CONTAINER_NAME) bash
purge: down
	sudo rm -rf $(DATA_FOLDER)/*
