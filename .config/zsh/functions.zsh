#!/usr/bin/zsh

# IMPORTANT: We MUST use MODIFIED_PATH (see notes in ~/.zshrc).
# Otherwise tools like `curl`, `sh` etc can't be found otherwise.
export PATH="$MODIFIED_PATH"

function brew_update {
  brew update
  brew outdated
  brew upgrade
}

function update {
  brew_update
}

export MODIFIED_PATH="$PATH"
