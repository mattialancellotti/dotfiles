# The needed programs
STOW = stow

# Collecting all the configuration files in the current directory
DIRS := $(wildcard dotfiles/*)

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
STOWDIR = $(HOME)/.local/share/stow
CONFDIR = $(HOME)/.config
HOMEDIR = $(HOME)

SFUNC = $(STOW) --verbose=1 --target=$(1) --dir=$(STOWDIR) --dotfiles --stow $(2)
UFUNC = $(STOW) --verbose=1 --target=$(1) --dir=$(STOWDIR) --dotfiles --delete $(2)

INSTALL = $(foreach pkg,$(1),$(shell \
	  	$(if $(findstring dot-home,$(pkg)), \
	  		$(call $(2),$(HOMEDIR),$(notdir $(pkg))),\
			$(call $(2),$(CONFDIR),$(notdir $(pkg))))))

# Test variables.
# This variables use the built-in command `command` to check if a program is
# installed or not. The `-v` flag will print the actual pathof the binary.
STOW_CHCK := $(shell command -v $(STOW))

# If no output was given, hence no binary was found, throw an error to warn the
# user about what software needs to be installed.
ifeq ($(STOW_CHCK),)
  $(error The program '$(STOW)' is needed to run this Makefile.)
endif

$(STOWDIR):
	@echo "Copying your package to the stow directory ($(STOWDIR))."
	mkdir --parents $(STOWDIR)
	cp --recursive --verbose $(DIRS) $(STOWDIR)
	@echo "Done."

.PHONY: install uninstall
install:
	$(call INSTALL,$(DIRS),SFUNC)

uninstall:
	$(call INSTALL,$(DIRS),UFUNC)
