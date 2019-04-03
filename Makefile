LEKTOR_SERVER_FLAGS=-h 127.0.0.1

all: build

sass:
	./sassc/bin/sassc -t compressed ./assets/sass/main.scss ./assets/css/main.min.css
	./sassc/bin/sassc -t compressed ./assets/sass/ie9.scss ./assets/css/ie9.min.css
	lektor clean --yes
	lektor build

sass-uncompressed:
	./sassc/bin/sassc ./assets/sass/main.scss ./assets/css/main.css
	./sassc/bin/sassc ./assets/sass/ie9.scss ./assets/css/ie9.css
	lektor clean --yes
	lektor build

install:
	if hash apt 2>/dev/null; then sudo apt update; sudo apt install imagemagick python3 python3-pip -y; elif hash pacman 2>/dev/null; then sudo pacman -Sy imagemagick python python-pip --noconfirm; elif hash dnf 2>/dev/null; then sudo dnf install -y ImageMagick  python3 python3-pip; else echo -e "Please install Imagemagick, Python3 and Pip!"; fi
	pip install lektor --user
	make install-sassc

install-sassc:
	if [ ! -d './sassc' ]; then git clone https://github.com/sass/sassc.git sassc; . sassc/script/bootstrap ; make -C sassc -j4 ; fi

build: sass
	lektor build

server:
	lektor server $(LEKTOR_SERVER_FLAGS)

