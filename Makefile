STOW = stow
CONF = ${HOME}/.config
SFLAGS = --verbose=1 --target=$(CONF) --dotfiles

DIRS := $(shell ls -d [^dot]*/)
CHCK := $(shell command -v $(STOW))

# Checks if stow is installed. If not make throws an error.
ifeq ($(CHCK),)
  $(error The program '$(STOW)' is needed to run this Makefile.)
endif

.PHONY: conf
conf :
	$(foreach pkg,$(DIRS),$(shell $(STOW) $(SFLAGS) $(basename $(pkg))))
	@stow --target=$(HOME) --verbose=1 --dotfiles dot-home/
