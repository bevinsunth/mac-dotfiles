.PHONY: all clean test check install link

.DEFAULT_GOAL := help

DOTFILES := $(shell pwd)

.PHONY: link
link:  ## Symlink dotfiles into $HOME (run once on new machine)
	@$(MAKE) _link_file SRC=$(DOTFILES)/.zshrc DST=$$HOME/.zshrc
	@$(MAKE) _link_file SRC=$(DOTFILES)/.config/starship.toml DST=$$HOME/.config/starship.toml
	@$(MAKE) _link_file SRC=$(DOTFILES)/.config/zsh DST=$$HOME/.config/zsh
	@$(MAKE) _link_file SRC=$(DOTFILES)/.config/ghostty DST=$$HOME/.config/ghostty
	@$(MAKE) _link_file SRC=$(DOTFILES)/.config/humanlog DST=$$HOME/.config/humanlog
	@mkdir -p $$HOME/.git-hooks
	@$(MAKE) _link_file SRC=$(DOTFILES)/.git-hooks/commit-msg DST=$$HOME/.git-hooks/commit-msg
	@chmod +x $(DOTFILES)/.git-hooks/commit-msg
	@echo "Done."

_link_file:
	@if [ -e "$(DST)" ] && [ ! -L "$(DST)" ]; then \
		echo "WARNING: $(DST) already exists — remove it manually before symlinking"; \
	else \
		ln -sf $(SRC) $(DST); \
	fi

.PHONY: check
check:  ## Check all Brewfile packages are installed
	brew bundle check --verbose

.PHONY: install
install:  ## Install missing Brewfile packages
	brew bundle install

help:
	@printf "Targets\n"
	@(grep -h -E '^[0-9a-zA-Z_.-]+:.*?## .*$$' $(MAKEFILE_LIST) || true) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-22s\033[0m %s\n", $$1, $$2}'
	@printf "\nDefault target\n"
	@printf "\033[36m%s\033[0m" $(.DEFAULT_GOAL)
	@printf "\n\nMake Variables\n"
	@(grep -h -E '^[0-9a-zA-Z_.-]+\s[:?]?=.*? ## .*$$' $(MAKEFILE_LIST) || true) | sort | awk 'BEGIN {FS = "[:?]?=.*?## "}; {printf "\033[36m%-25s\033[0m %s\n", $$1, $$2}'
