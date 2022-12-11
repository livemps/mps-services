
include .env
CERT_FOLDER = $(DATA_FOLDER)/certs/$(OPENVPN_DOMAIN)
CFG_FILE = $(CERT_FOLDER)/srv/$(OPENVPN_DOMAIN)_bridged.conf
#RSA_SIZE=2048
#RSA_SIZE=1024



default:all
.PHONY: prepare build-conf build-container up down restart logs execi check ps

all: build up

prepare:
	mkdir -p $(DATA_FOLDER)/certs
	sudo apt install uml-utilities openvpn
	
$(CFG_FILE):
	./create_certs_vpn.bash -o $(DATA_FOLDER)/certs -R $(CONTAINER_IP) \
		-r $(RSA_SIZE) -a 256 -d 3650 -s $(OPENVPN_DOMAIN) -y -S -C -p -t all \
		-u $(USER_LIST)
	sudo chown odem:docker -R $(DATA_FOLDER)

build: $(CFG_FILE) prepare
	docker-compose build

up: build
	sudo docker-compose up -d

down:
	docker-compose down

restart: build
	docker-compose restart
logs:
	docker logs $(CONTAINER_NAME)_bridged
exec:
	docker exec -ti $(CONTAINER_NAME)_bridged bash

purge: down
	sudo rm -rf $(DATA_FOLDER)

CHECK_HOSTS_UP = $(eval HOSTS_UP=$(shell docker-compose ps | grep -v "\-\-\-\-\-" | grep -v "Command" | grep -o "Up" | wc -l))
CHECK_HOSTS_DOWN = $(eval HOSTS_DOWN=$(shell docker-compose ps | grep -v "\-\-\-\-\-" | grep -v "Command" | grep -o "Down" | wc -l))
check:
	$(CHECK_HOSTS_UP)
	$(CHECK_HOSTS_DOWN)
	@echo "$(CONTAINER_NAME) => Up: $(HOSTS_UP) Down: $(HOSTS_DOWN)"
ps: 
	@echo "### $(CONTAINER_NAME) #####"
	@docker-compose ps | grep -v "\-\-\-\-\-" | grep -v "Command"
