#!/usr/bin/env ruby

require 'fileutils'

def symlink(file, destination_folder)
  filename = File.join(working_dir, file)

  resolved_destination = File.expand_path(destination_folder)
  sym_link = File.join(resolved_destination, File.basename(filename))

  FileUtils.rm sym_link if File.symlink?(sym_link)
  FileUtils.ln_s filename, sym_link
end

def working_dir
  File.expand_path(File.dirname(__FILE__))
end

def install_vim_plugin(git_repo)
  IO.popen("git")
  repo_name = git_repo.split("/")[1]
  system("git clone https://github.com/#{git_repo} ~/.vim/bundle/#{repo_name}")
  system('vim -u NONE -c "Helptags" -c q')
end

def mkdir(dir)
  FileUtils.mkdir_p File.expand_path(dir)
end

mkdir("~/.tmp")

[
  "bin",
  ".vim",
  ".vimrc",
  ".tmux.conf",
  ".bash_profile",
].each do |file|
  symlink(file, "~")
end

[
  "kien/ctrlp.vim.git",
  "scrooloose/nerdtree.git",

  "easymotion/vim-easymotion",

  "bling/vim-airline",
  "edkolev/tmuxline.vim",

  "tomtom/tlib_vim.git",
  "MarcWeber/vim-addon-mw-utils.git",
  "garbas/vim-snipmate.git",
  "honza/vim-snippets.git",

  "airblade/vim-gitgutter.git",
  "tpope/vim-fugitive.git",
].each do |plugin|
  install_vim_plugin(plugin)
end
