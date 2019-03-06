LEKTOR_SERVER_FLAGS=-h 127.0.0.1

all: build

sass:
	sass -t compressed ./assets/sass/main.scss ./assets/css/main.min.css
	sass -t compressed ./assets/sass/ie9.scss ./assets/css/ie9.min.css
	rm ./assets/css/main.min.css.map
	rm ./assets/css/ie9.min.css.map
	lektor clean --yes
	lektor build

sass-uncompressed:
	sass ./assets/sass/main.scss ./assets/css/main.css
	sass ./assets/sass/ie9.scss ./assets/css/ie9.css
	rm ./assets/css/main.css.map
	rm ./assets/css/ie9.css.map
	lektor clean --yes
	lektor build

install:
	pip install lektor --user
	gem install sass

build: sass
	lektor build

server:
	lektor server $(LEKTOR_SERVER_FLAGS)

