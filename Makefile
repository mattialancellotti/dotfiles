# The needed programs
SHELL = /bin/sh
STOW = stow
GZIP = gzip
TAR  = bsdtar
RM   = rm --recursive --force


# Collecting all the configuration files in the current directory.
# Imma explain it in bash:
#
# declare -a DOTFILES;
# for pkg in $(ls dotfiles/); do
# 	DOTFILES += $(basename $pkg);
# done
DOTFILES = $(foreach pkg,$(wildcard dotfiles/*),$(shell basename $(pkg)))

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
prefix = $(HOME)

# Configuring flags for creating a distribution archive (.tar.gz)
TARNAME  = mattia\'s-shitty-dotfiles.tar
TARFLAGS = --create --file $(TARNAME)
ZIPFLAGS = --recursive --synchronous $(TARNAME)

COMMON_FLAGS = --verbose=1 --target=$(prefix) --dir=$(STOWDIR) --dotfiles

INSTALL_PROGRAM = $(STOW) $(COMMON_FLAGS)

# Test variables.
# This variables use the built-in command `command` to check if a program is
# installed or not. The `-v` flag will print the actual path of the binary.
STOW_CHCK := $(shell command -v $(STOW))

# If no output was given, hence no binary was found, throw an error to warn the
# user about what software needs to be installed.
ifeq ($(STOW_CHCK),)
  $(error The program '$(STOW)' is needed to run this Makefile.)
endif

# This is a variable the user can set to stow/unstow only some of the dotfiles
# and not all of them.
ifeq ($(programs),)
  programs := $(DOTFILES)
endif

.PHONY: all install uninstall dist
install:
	$(INSTALL_PROGRAM) --restow $(programs)

uninstall:
	$(INSTALL_PROGRAM) --delete $(programs)

dist:
	$(TAR) $(TARFLAGS) $(ROOTDIR)/*
	$(GZIP) $(ZIPFLAGS)
	$(RM) $(TARNAME)

.DEFAULT: install
