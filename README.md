# nixvim config ❄️

this is my personal neovim setup powered by nixvim.
it's got all my preferred plugins, lsps, and formatters ready to go out of the box.

## how to run

you don't even need to clone this repo. assuming you have nix installed, you can launch it from anywhere by just running:

```bash
nix run github:kuruae/nixvim-flake
```
*(note: this github repo is just a read-only mirror!)*

## the "mini" branch

if you just want to save storage, check out the [mini branch](https://codeberg.org/kuru/nixvim-flake/src/branch/mini). 

it strips out all the heavy nix-managed toolchains (like rust, python, and c++) and falls back to your system's packages instead.
to run the mini version:

```bash
nix run github:kuru/nixvim-flake#mini
```
