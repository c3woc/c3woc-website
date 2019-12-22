LEKTOR_SERVER_FLAGS=-h 127.0.0.1
# minify javascript assets, compile scss assets
LEKTOR_PLUGIN_FLAGS=-f scss
LEKTOR_DEPLOY_FLAGS=

all: build

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
	pip3 install wheel --user
	pip3 install lektor --user


build:
	lektor clean --yes
	lektor plugin flush-cache 
	python3 -m lektor build $(LEKTOR_PLUGIN_FLAGS)

server:
	python3 -m lektor server $(LEKTOR_SERVER_FLAGS) $(LEKTOR_PLUGIN_FLAGS)
	
deploy:
	lektor clean --yes
	lektor plugin flush-cache
	lektor build $(LEKTOR_PLUGIN_FLAGS) $(LEKTOR_DEPLOY_FLAGS)
	lektor deploy $(LEKTOR_PLUGIN_FLAGS) $(LEKTOR_DEPLOY_FLAGS)

pull:
	if git config remote.github.url > /dev/null; then
	  git pull github master
	else
	  git remote add github git@github.com:c3woc/c3woc-website.git
	  git pull github master
	fi
	if git config remote.gitea.url > /dev/null; then
	  git pull gitea master
	else
	  git remote add gitea gitea@gitea.see-base.de:C3WOC/c3woc-webseite.git
	  git pull gitea master
	fi
	git pull origin master

push:
	if git config remote.gitea.url > /dev/null; then
	  git push gitea master
	else
	  git remote add gitea gitea@gitea.see-base.de:C3WOC/c3woc-webseite.git
	  git push gitea master
	fi
	if git config remote.github.url > /dev/null; then
	  git push github master
	else
	  git remote add github git@github.com:c3woc/c3woc-website.git
	  git push github master
	fi
