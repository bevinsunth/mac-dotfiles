# dotfiles

> \[!TIP\]
> Clone this repo to `~/Documents/Projects/mac-dotfiles` then symlink files.\
> e.g. `ln -s ~/Documents/Projects/mac-dotfiles/.config ~/.config`


### Link Files

Run once after cloning to symlink dotfiles into `$HOME`:

```shell
make link
```

### Git Hooks

Global git hooks live in `.git-hooks/`. Symlink each hook into `~/.git-hooks/` - `hooksPath` is already set in `.gitconfig`.

```shell
mkdir -p ~/.git-hooks
ln -sf ~/Documents/Projects/mac-dotfiles/.git-hooks/prepare-commit-msg ~/.git-hooks/prepare-commit-msg
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

## GUIs

- [Android File Transfer](https://www.android.com/filetransfer/): `brew install --cask android-file-transfer`
- [Rio Terminal](https://raphamorim.io/rio/): `brew install --cask rio`
- [Warp Terminal](https://www.warp.dev/): `brew install --cask warp`.
- [goread](https://github.com/TypicalAM/goread): `brew install goread`.
- [alltomp3](https://alltomp3.org/): for backing up Spotify music.
- [makemkv](https://makemkv.com/): rip DVDs and Blu-ray discs.
- [flameshot](https://flameshot.org/): annotate images.
- [owly](https://apps.apple.com/us/app/owly-display-sleep-prevention/id882812218): prevent screen going to sleep.


## Acknowledgments

This project is a fork of [Integralist/dotfiles](https://github.com/Integralist/dotfiles). 
Special thanks to [Integralist](https://github.com/Integralist) for the original configuration and inspiration.
