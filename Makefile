.PHONY: all clean test check install link

.DEFAULT_GOAL := help

DOTFILES := $(shell pwd)

.PHONY: link
link:  ## Symlink dotfiles into $HOME (run once on new machine)
	ln -sf $(DOTFILES)/.zshrc $$HOME/.zshrc
	ln -sf $(DOTFILES)/.config/zsh $$HOME/.config/zsh
	ln -sf $(DOTFILES)/.config/ghostty $$HOME/.config/ghostty
	ln -sf $(DOTFILES)/.config/starship.toml $$HOME/.config/starship.toml
	ln -sf $(DOTFILES)/.config/humanlog $$HOME/.config/humanlog
	mkdir -p $$HOME/.git-hooks
	ln -sf $(DOTFILES)/.git-hooks/prepare-commit-msg $$HOME/.git-hooks/prepare-commit-msg
	@echo "Symlinks created."

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
