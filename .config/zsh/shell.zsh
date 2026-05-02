#!/usr/bin/zsh

# IMPORTANT: We MUST use MODIFIED_PATH (see notes in ~/.zshrc).
# Otherwise tools like `curl`, `sh` etc can't be found otherwise.
export PATH="$MODIFIED_PATH"

# Increase the number of file descriptors from default of 254.
ulimit -n 10240

# Ensure every new shell instance has our ssh keys added.
#
# NOTE: To figure out which local SSH key matches the SSH key in GitHub:
# ssh-keygen -lf ~/.ssh/<private_ssh_filename> -E sha256
#
# Also try:
# ssh -vT git@github.com

# Ensure terminal prompt is two lines under the actual Starship prompt.
PROMPT="${PROMPT}"$'\n\n'
