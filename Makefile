LEKTOR_SERVER_FLAGS=-h 127.0.0.1

all: build

sass:
	lektor clean --yes
	lektor server -f jsminify 

.ONESHELL:
install:
	if hash apt-get 2>/dev/null; then
	  sudo apt-get update -qq >/dev/null && sudo apt-get install -qq apt-utils imagemagick python3-pip python3-setuptools gcc
	elif hash pacman 2>/dev/null; then
	  sudo pacman -Syu imagemagick python-pip glibc lib32-glibc gcc --noconfirm
	elif hash dnf 2>/dev/null; then
	  sudo dnf install -y ImageMagick python3-pip gcc
	else 
	  echo -e "Please install Imagemagick, python3-pip and gcc"
	fi
	pip install lektor --user
	# pip3 install wheel --user
	lektor plugin flush-cache

install-sassc:
	lektor plugin flush-cache
	lektor clean --yes
	lektor build -f jsminify

build:
	lektor clean --yes
	lektor build -f jsminify 

server:
	lektor server $(LEKTOR_SERVER_FLAGS)

