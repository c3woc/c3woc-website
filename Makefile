LEKTOR_SERVER_FLAGS=-h 127.0.0.1

all: build

sass:
	sassc ./assets/sass/main.scss ./assets/css/main.css
	sassc ./assets/sass/ie9.scss ./assets/css/ie9.css
	rm ./assets/css/main.min.css
	rm ./assets/css/ie9.min.css
	python3 ./deployment/cssminify.py -o ./assets/css/main.min.css ./assets/css/main.css
	python3 ./deployment/cssminify.py -o ./assets/css/ie9.min.css ./assets/css/ie9.css

install:
	pip install lektor

build: sass
	lektor build

server:
	lektor server $(LEKTOR_SERVER_FLAGS)

## Docker stuff
IMAGE_TAG:=v1.2.0
IMAGE:=toolboxbodensee/lektor:$(IMAGE_TAG)

PWD:=$(shell pwd)

CACHE:=$(HOME)/.cache
PWD:=$(shell pwd)

LEKTOR_CACHE:=$(CACHE)/lektor
CACHE_VOL:=-v $(CACHE)/lektor:/home/lektor/.cache/lektor
SOURCE_VOL:=-v $(PWD):/opt/lektor

EXPORTED_PORTS=-p 5000:5000

DOCKER:=docker

# On linux...
ifeq ($(shell uname),Linux)
	# When user is not in docker group
	ifneq ($(findstring docker,$(shell groups)),docker)
		# And the user is not root
		ifneq ($(shell whoami),root)
			# Run docker client inside docker group
			DOCKER:=sudo -E -g docker docker
		endif
	endif
endif

RUN:=run --rm -it $(SOURCE_VOL) $(CACHE_VOL)

$(LEKTOR_CACHE):
	mkdir -p $(LEKTOR_CACHE)

docker-pull:
	$(DOCKER) pull $(IMAGE)

docker-build: docker-pull $(LEKTOR_CACHE)
	$(DOCKER) $(RUN) $(IMAGE) make build

docker-shell: $(LEKTOR_CACHE) docker-pull
	$(DOCKER) $(RUN) $(EXPORTED_PORTS) $(IMAGE) /bin/sh

docker-server: $(LEKTOR_CACHE) docker-pull
	$(DOCKER) $(RUN) $(EXPORTED_PORTS) $(IMAGE) make sass
	$(DOCKER) $(RUN) $(EXPORTED_PORTS) $(IMAGE) lektor server -h 0.0.0.0
