# dotfiles

This is a collection of neovim, zsh, and kitty configurations. These dotfiles are how _I_ like to do things, and may or may not be useful to you. I'm constantly changing these and am very much open to suggestions, so please open an issue if you have ideas!

![image info](./screenshots/Neovim.png) ![image info](./screenshots/Kitty.png)

## Features

The following are the main reason I created my dotfiles. For an extended list of everything inside these dotfiles, see [here](#features-extended)

- [Neovim](https://neovim.io/) - A refactor of Vim with better plugin support. See the screenshots above for a preview of my color scheme.
- [Zsh](https://en.wikipedia.org/wiki/Z_shell) - Better Unix shell
- [Kitty](https://sw.kovidgoyal.net/kitty/) - GPU based terminal emulator

Other tools/features included in these dotfiles:

- Neovim (coc.nvim, optimized for reason/ocaml development)
- Zsh
- [prezto](https://github.com/sorin-ionescu/prezto)
- Kitty
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [Hammerspoon](http://www.hammerspoon.org/go/)
- Fzf
- Ripgrep
- Homebrew
- Mac OS Setup

Some other apps I use on a day-to-day basis:

- Alfred
- Flux
- Firefox (with the Vim and GitHub dark mode extensions)

## Getting Started

First, download the following tools.

- [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- [Zsh and Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
- [Kitty](https://sw.kovidgoyal.net/kitty/#quickstart)

Clone the project.

```
git clone https://github.com/dylanirlbeck/dotfiles.git ~/dotfiles
```

For dotfile management I use [dotbot](https://github.com/anishathalye/dotbot).
Running the following should establish the right symlinks; you may have to
delete a few files to get it working, but instructions to do so should show up
accordingly.

```
./install
```

> Note that I don't recommend blindly copying dotfiles from anyone, including me. A better approach is to pull pieces of what want and build up your own dotfiles iteratively (so you actually understand what's going on!).

### First time setup for MacOS users (experimental)

After cloning this repo, you can run `first_time_setup.sh` to get a copy of *my* MacOS setup (i.e. apps, packages, dock, and general settings).

```
./first_time_setup.sh
```

> Note that this script is rather new and very experimental, and you should use with discretion.

## Neovim setup

From this point on, you'll need to install [VimPlug](https://github.com/junegunn/vim-plug) for plugin management. After doing so, run `:PlugInstall` inside of Neovim to install the proper plugins.

### OCaml/Reason

Things you'll need:

* [esy](esy.sh)
* [ocamlformat](https://github.com/ocaml-ppx/ocamlformat) -- note, if you want to use `ocamlformat` with my ALE setup you'll likely need to run `opam pin ocamlformat 0.14.1` to put `ocamlformat` in your system's PATH
* [opam](http://opam.ocaml.org/doc/Install.html) with OCaml version 4.06.1 installed
* [ocaml-lsp](https://github.com/ocaml/ocaml-lsp)

> Note that my setup doesn't work for editing a standalone Reason file (it does support editing a standalone OCaml file). For linting/formatting and language server support, will want to edit your files inside a BuckleScript or Reason native project.
