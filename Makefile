STOW = stow
TDIR = ${HOME}/.config
DIRS := $(shell ls -d */)

configure :
	$(foreach dir,$(DIRS),$(shell $(STOW) --target=$(TDIR) $(basename $(dir))))
