# dotfiles

### Setup

Clone then run once to symlink all dotfiles and git hooks into `$HOME`:

```shell
git clone <repo> ~/Documents/projects/mac-dotfiles
cd ~/Documents/projects/mac-dotfiles
make link
```

### Prompt

![Terminal Prompt](./terminal-prompt-ui.png)

> \[!NOTE\]
> If using Ghostty, it comes with Nerd Fonts installed `ghostty +list-fonts`.\
> Otherwise you'll need [nerdfonts.com](https://www.nerdfonts.com/) installed and selected as the terminal's font.\
> e.g. `brew install font-hack-nerd-font`\
> Will install "Hack Nerd Font Mono".

## Git Hooks

The `commit-msg` hook auto-prefixes commit messages with the ticket number from the branch name (e.g. `ABC-123 my message`).

`make link` sets the hook up and marks it executable. The `commit-msg` hook is used instead of `prepare-commit-msg` because JetBrains IDEs (Rider, etc.) only run `commit-msg` - using `prepare-commit-msg` would silently skip in those IDEs.

> \[!NOTE\]
> If you add new hooks, ensure they are also marked executable in the `link` Makefile target.

## Tools

There is a [`Brewfile`](./Brewfile) which lists all Homebrew packages. Use the Makefile targets to manage them:

```shell
make check    # check what's installed vs missing
make install  # install any missing packages
```

You can also regenerate the Brewfile from your current installed packages:

```shell
brew bundle dump --force
```

## Acknowledgments

This project is a fork of [Integralist/dotfiles](https://github.com/Integralist/dotfiles). 
Special thanks to [Integralist](https://github.com/Integralist) for the original configuration and inspiration.
