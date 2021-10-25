# The needed programs
STOW = stow
MENU = dialog

# Collecting all the configuration files in the current directory
DIRS := $(shell ls -d */)

# Paths to which copy your dotfiles
LCONF = ${HOME}/.config
HCONF = ${HOME}

# $(MENU) arguments
MFLAGS = --output-fd 1 --erase-on-exit --no-tags \
	 --checklist "Choose which configs to load." 30 130 20
MARGS := $(foreach pkg,$(DIRS),$(pkg) $(pkg) off)

# Usefull functions
SFUNC = $(STOW) --verbose=1 --target=$(1) --dotfiles $(2)
MFUNC = $(MENU) $(MFLAGS) $(MARGS)
INSTALL := $(foreach pkg,$(1),$(shell \
	  	$(if $(findstring dot-home,$(pkg)), \
	  		$(call SFUNC,$(HCONF),$(basename $(pkg))),\
			$(call SFUNC,$(LCONF),$(basename $(pkg))))))

# Test variables.
# This variables use the built-in command `command` to check if a program is
# installed or not. The `-v` flag will print the actual pathof the binary.
STOW_CHCK := $(shell command -v $(STOW))
MENU_CHCK := $(shell command -v $(MENU))

# If no output was given, hence no binary was found, throw an error to warn the
# user about what software needs to be installed.
ifeq ($(STOW_CHCK),)
  $(error The program '$(STOW)' is needed to run this Makefile.)
endif

ifeq ($(MENU_CHCK),)
  $(error The program '$(MENU)' is needed to run this Makefile.)
endif

.PHONY: conf menu
config:
	$(call INSTALL,$(DIRS))

# Displaying a tty menu using dialog to make the user choose which config file
# should be stowed and which one should not.
DIRS=$(call MFUNC)
menuconfig:
	$(call INSTALL,$(shell $(call MFUNC)))
