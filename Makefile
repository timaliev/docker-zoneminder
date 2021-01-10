NS ?= ponte124
VERSION ?= arm64v8-1.34
IMAGE_NAME ?= zoneminder
CONTAINER_NAME ?= zoneminder
CONTAINER_INSTANCE ?= manual
PORTS ?= --network=zm -p 80:80 --link mariadb
VOLUMES ?= -v /etc/localtime:/etc/localtime:ro -v dkvol_zm_cache:/var/cache/zoneminder -v dkvol_zm_logs:/var/log/zm -v dkvol_zm_events:/var/lib/zoneminder/events --shm-size=1024m
ENV ?= -e TZ=Europe/Madrid

build:
	docker build -t $(NS)/$(IMAGE_NAME):$(VERSION) -f Dockerfile .

push:
	docker push $(NS)/$(IMAGE_NAME):$(VERSION)

shell: 
	docker run --rm --name $(CONTAINER_NAME)-$(CONTAINER_INSTANCE) -i -t $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(IMAGE_NAME):$(VERSION) /bin/bash

runprereqs:
	docker run -d --rm -e MYSQL_ROOT_PASSWORD=zmpass -e MYSQL_DATABASE=zm -e MYSQL_USER=zmuser -e MYSQL_PASSWORD=zmpass --name mariadb --network=zm -p 3306:3306 -v dkvol_mysql_data:/var/lib/mysql arm64v8/mariadb:10-focal

run: 
	docker run --rm --name $(CONTAINER_NAME)-$(CONTAINER_INSTANCE) $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(IMAGE_NAME):$(VERSION)

start: 
	docker run -d --name $(CONTAINER_NAME)-$(CONTAINER_INSTANCE) $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(IMAGE_NAME):$(VERSION)

stop:
	docker stop $(CONTAINER_NAME)-$(CONTAINER_INSTANCE)

rm:
	docker rm $(CONTAINER_NAME)-$(CONTAINER_INSTANCE)

default: run
