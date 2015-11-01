#!/usr/bin/env sh

ruby create_symlinks.rb

mkdir -p ~/.tmp

mkdir -p ~/.vim/bundle
cd ~/.vim/bundle

git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/scrooloose/nerdtree.git

git clone https://github.com/easymotion/vim-easymotion

git clone https://github.com/bling/vim-airline
git clone https://github.com/edkolev/tmuxline.vim

git clone https://github.com/tomtom/tlib_vim.git
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
git clone https://github.com/garbas/vim-snipmate.git
git clone https://github.com/honza/vim-snippets.git

git clone git://github.com/airblade/vim-gitgutter.git
git clone git://github.com/tpope/vim-fugitive.git
vim -u NONE -c "helptags vim-fugitive/doc" -c q

vim -u NONE -c "Helptags" -c q
