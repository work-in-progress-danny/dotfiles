# A simple [Exa](https://github.com/ogham/exa) ls-tree-like-command wrapper

A simple [exa](https://github.com/ogham/exa) [ls-tree-like-command (--level=(depth))](https://github.com/ogham/exa#filtering-options) wrapper to be included in my dotfiles and replace the shell script I had:

```zsh
exa_interactive_tree_script(){
  if [[ $1 -gt 0 ]]
  then
      exa --tree --level=$1 -hal --git --time-style=long-iso
  else
      echo "Please provide a number for depth of tree lists";
  fi
}
```

## Installation

1. cd into directory run `$ cargo build release`
2. copy or symlink `target/release/exa_list_tree` whereever you'd like the executable binary
3. alias the binary in your `.zshrc/.bashrc` with `alias ltree='~/.dotfiles/scripts/exa_list_tree'`

NOTE: you will have to change the output file's permissions with:

```zsh
chmod +x <PATH TO SCRIPT>/exa_list_tree
```

e.g:

```zsh
chmod +x ~/scripts/exa_list_tree
```

## Usage

```zsh
exa_list_tree <DEPTH> <PATH>
# DEPTH of directories you want to print
# <optional> PATH to directory you want to print, defaults to current working directory
#
# e.g exa_list_tree 3 ~
#
# ~/
#   project/
#       .someProjectDir/
#       someProject.file
#       someProject.file
#   project/
#       .someProjectDir/
#       someProject.file
#       someProject.file
```
