STOW = stow
TDIR = ${HOME}/.config
SFLAGS = -v 1 -t $(TDIR) --dotfiles

DIRS := $(shell ls -d */)
CHCK := $(shell command -v $(STOW))

# Checks if stow is installed. If not make throws an error.
ifeq ($(CHCK),)
  $(error The program '$(STOW)' is needed to run this Makefile.)
endif

.PHONY: conf
conf :
	$(foreach pkg,$(DIRS),$(shell $(STOW) $(SFLAGS) $(basename $(pkg))))
