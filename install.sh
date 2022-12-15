#!/bin/bash

# Based on https://github.com/bstollnitz/dotfiles
# and associated blog post: https://bea.stollnitz.com/blog/codespaces-terminal/

create_symlinks() {
    # Get the directory in which this script lives.
    script_dir=$(dirname "$(readlink -f "$0")")

    # Get a list of all files in this directory that start with a dot.
    files=$(find -maxdepth 1 -type f -name ".*")

    # Create a symbolic link to each file in the home directory.
    for file in $files; do
        name=$(basename $file)
        echo "Creating symlink to $name in home directory."
        rm -rf ~/$name
        ln -s $script_dir/$name ~/$name
    done
}

create_symlinks

# Powerline fonts
echo "Installing fonts."
FONT_DIR="$HOME/.fonts"
git clone https://github.com/powerline/fonts.git $FONT_DIR --depth=1
cd $FONT_DIR
./install.sh

# Pure prompt
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
