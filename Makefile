STOW = stow
MENU = dialog
CONF = ${HOME}/.config
SFLAGS = --verbose=1 --target=$(CONF) --dotfiles
DIRS := $(shell ls -d */)

MFLAGS = --output-fd 1 --erase-on-exit --no-tags \
	 --checklist "Choose which configs to load." 30 130 20
MARGS := $(foreach pkg,$(DIRS),$(pkg) $(pkg) off)
SFUNC = $(STOW) --verbose=$(1) --target=$(2) --dotfiles $(3)

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
conf :
	$(foreach pkg,$(DIRS),$(shell \
				$(if $(findstring dot-home,$(pkg)),\
				$(call SFUNC,1,${HOME},$(basename $(pkg))),\
				$(call SFUNC,1,$(CONF),$(basename $(pkg))))))

# Displaying a tty menu using dialog to make the user choose which config file
# should be stowed and which one should not.
menu :
	$(foreach pkg,$(shell $(MENU) $(MFLAGS) $(MARGS)),\
			$(shell \
				$(if $(findstring dot-home,$(pkg)),\
				$(call SFUNC,1,${HOME},$(basename $(pkg))),\
				$(call SFUNC,1,$(CONF),$(basename $(pkg))))))
