# The needed programs
SHELL = /bin/sh
STOW = stow
GZIP = gzip
TAR  = bsdtar
RM   = rm --recursive --force


# Collecting all the configuration files in the current directory
CONFILES := $(shell ls -d */)
DOTFILES := $(shell ls dot-*)
ROOTDIR = dotfiles

# These are some useful paths needed by stow to actually do its job:
#   - First we have the `STOWDIR` (or stow directory as referred to by `man
#     stwo`) that is the directory in which a copy of the package will be kept;
#   - Then stow requires the actual directory in which the package wants to
#     appear installed, in this case my dotfiles gets installed in 2 locations:
#     	- Home directory (as `HOMEDIR`);
#     	- Config directory defined by XDG standard (as `CONFDIR`).
# 
# P.S. The fact that there are 2 different target directory (`STOWDIR` and
# `HOMEDIR`) shouldn't be happening, but it's a way of solving a bug that
# doesn't get fixed in stow and that is not applying --dotfiles to directories.
STOWDIR = dotfiles
CONFDIR = $(HOME)/.config
HOMEDIR = $(HOME)

# Configuring flags for creating a distribution archive (.tar.gz)
TARNAME  = mattia\'s-shitty-dotfiles.tar
TARFLAGS = --create --file $(TARNAME)
ZIPFLAGS = --recursive --synchronous $(TARNAME)

COMMON_FLAGS = --verbose=1 --dir=$(STOWDIR) --dotfiles
SFUNC = $(STOW) --verbose=1 --target=$(1) --dir=$(STOWDIR) --dotfiles --restow $(2)
UFUNC = $(STOW) --verbose=1 --target=$(1) --dir=$(STOWDIR) --dotfiles --delete $(2)

INSTALL = $(foreach pkg,$(1),$(shell $(call $(2),$(3),$(pkg))))

INSTALL_PROGRAM = $(STOW) $(COMMON_FLAGS)
# Test variables.
# This variables use the built-in command `command` to check if a program is
# installed or not. The `-v` flag will print the actual pathof the binary.
STOW_CHCK := $(shell command -v $(STOW))

# If no output was given, hence no binary was found, throw an error to warn the
# user about what software needs to be installed.
ifeq ($(STOW_CHCK),)
  $(error The program '$(STOW)' is needed to run this Makefile.)
endif

.PHONY: all install uninstall dist
all: install

install: install_config install_home

install_config:
	$(INSTALL_PROGRAM) --target=$(CONFDIR) --restow $(CONFILES)

install_home:
	$(INSTALL_PROGRAM) --target=$(HOMEDIR) --restow $(DOTFILES)

uninstall:
	$(call INSTALL,$(CONFILES),UFUNC,$(CONFDIR))
	$(call INSTALL,$(DOTFILES),UFUNC,$(HOMEDIR))

dist:
	$(TAR) $(TARFLAGS) $(ROOTDIR)/*
	$(GZIP) $(ZIPFLAGS)
	$(RM) $(TARNAME)

.DEFAULT: all
