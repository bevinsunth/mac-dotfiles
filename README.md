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
