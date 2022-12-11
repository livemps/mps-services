# Makefile Setup
.PHONY: default all build up down restart logs exec purge
default:all
all: build up

# Makefile config
include .env

# Compose targets
build:
	sudo mkdir -p $(DATA_FOLDER)
	sudo chown root:docker $(DATA_FOLDER)
	sudo chmod g+rw $(DATA_FOLDER)
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
	docker exec -it $(CONTAINER_NAME) bash
purge: down
	sudo rm -rf $(DATA_FOLDER)/*
CHECK_HOSTS_UP = $(eval HOSTS_UP=$(shell docker-compose ps | grep -v "\-\-\-\-\-" | grep -v "Command" | grep -o "Up" | wc -l))
CHECK_HOSTS_DOWN = $(eval HOSTS_DOWN=$(shell docker-compose ps | grep -v "\-\-\-\-\-" | grep -v "Command" | grep -o "Down" | wc -l))
check:
	$(CHECK_HOSTS_UP)
	$(CHECK_HOSTS_DOWN)
	@echo "$(CONTAINER_NAME) => Up: $(HOSTS_UP) Down: $(HOSTS_DOWN)"
ps:
	@echo "### $(CONTAINER_NAME) #####"
	@docker-compose ps | grep -v "\-\-\-\-\-" | grep -v "Command"
