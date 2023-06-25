LEKTOR_SERVER_FLAGS=-h 127.0.0.1
# minify javascript assets, compile scss assets
LEKTOR_PLUGIN_FLAGS=-f scss -f pretifyhtml
LEKTOR_DEPLOY_FLAGS=

.PHONY: all install venv build server deploy pull push

all: build

install:
	if hash apt-get 2>/dev/null; then \
	  apt-get update -qq >/dev/null && apt-get install -qq apt-utils imagemagick python3-pip python3-setuptools gcc git-lfs python3-venv rsync dos2unix; \
	elif hash pacman 2>/dev/null; then \
	  pacman -Syu imagemagick python-pip glibc lib32-glibc gcc git-lfs python3-venv rsync dos2unix --noconfirm; \
	elif hash dnf 2>/dev/null; then \
	  dnf install -y ImageMagick python3-pip gcc git-lfs rsync dos2unix; \
	else \
	  echo -e "Please install Imagemagick, python3-pip git-lfs, python3-venv, rsync, gcc and dos2unix"; \
	fi

venv:
	if [ -z "${VIRTUAL_ENV}" ]; then \
	  printf "Run '\033[0;33mpython3 -m venv lektor\033[0;37m' to create venv.\nRun '\033[0;33msource lektor/bin/activate\033[0;37m' to activate venv.\n"; \
	  printf "Run '\033[0;33mpip3 install wheel  --upgrade\033[0;37m' next.\nRun '\033[0;33mpip3 install lektor --upgrade\033[0;37m' to install lektor\n"; \
	fi

build:
	if [ -z "${VIRTUAL_ENV}" ]; then \
    printf "Run 'source lektor/bin/activate' to enable venv. Or 'make install' to create venv"; \
	else \
	  if python3 -m lektor --version 2>/dev/null; then \
	    python3 -m lektor build $(LEKTOR_PLUGIN_FLAGS); \
	  else \
	    lektor build $(LEKTOR_PLUGIN_FLAGS); \
	  fi; \
	fi

server:
	if [ -z "${VIRTUAL_ENV}" ]; then \
	  printf "Run 'source lektor/bin/activate' to enable venv. Or 'make install' to create venv"; \
	else \
	  if python3 -m lektor --version 2>/dev/null; then \
	    python3 -m lektor server $(LEKTOR_SERVER_FLAGS) $(LEKTOR_PLUGIN_FLAGS); \
	  else \
	    lektor server $(LEKTOR_SERVER_FLAGS) $(LEKTOR_PLUGIN_FLAGS); \
	  fi; \
	fi


deploy:
	if [ -z "${VIRTUAL_ENV}" ]; then \
	  printf "Run 'source lektor/bin/activate' to enable venv. Or 'make install' to create venv"; \
	else \
	  lektor plugin flush-cache; \
	  lektor clean --yes; \
	  if python3 -m lektor --version 2>/dev/null; then \
	    python3 -m lektor build $(LEKTOR_PLUGIN_FLAGS) $(LEKTOR_DEPLOY_FLAGS); \
	    unix2dos temp/builds/c3woc.de/waffeln.ics; \
	    python3 -m lektor deploy $(LEKTOR_PLUGIN_FLAGS) $(LEKTOR_DEPLOY_FLAGS); \
	  else \
	    lektor build $(LEKTOR_PLUGIN_FLAGS) $(LEKTOR_DEPLOY_FLAGS); \
	    unix2dos temp/builds/c3woc.de/waffeln.ics; \
	    lektor deploy $(LEKTOR_PLUGIN_FLAGS) $(LEKTOR_DEPLOY_FLAGS); \
	  fi; \
	fi


pull:
	if git config remote.github.url > /dev/null; then \
	  git pull github main; \
	else \
	  git remote add github https://github.com/c3woc/c3woc-website.git; \
	  git pull github main; \
	fi; \
	if git config remote.l3d.url > /dev/null; then \
	  git pull l3d main; \
	else \
	  git remote add l3d https://git.l3d.ch/c3woc/webseite.git; \
	  git pull l3d main; \
	fi; \
	git pull origin main

push:
	if git config remote.github.url > /dev/null; then \
	  git push github main; \
	else \
	  git remote add github https://github.com/c3woc/c3woc-website.git; \
	  git push github main; \
	fi; \
	if git config remote.l3d.url > /dev/null; then \
	  git push l3d main; \
	else \
	  git remote add l3d https://git.l3d.ch/l3d/webseite.git; \
	  git push l3d main; \
	fi
