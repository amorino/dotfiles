all: link run
.PHONY: all link run delete

SHELL := /bin/bash

# Symlink pattern (git configs)
LINK = $(patsubst %.symlink, ~/%, $(notdir $(wildcard **/*.symlink) $(wildcard **/.*.symlink)))

# Install scripts
RUN = $(wildcard **/*.install)

~/%: **/%.symlink
	@echo "- Linking $<"
	@ln -sF "$(CURDIR)/$<" "$@"

link: $(LINK)

run: $(RUN)
	@echo $^ | xargs -n 1 $(SHELL)

delete:
	@echo "- Removing linked files"
	@rm -f $(LINK)
