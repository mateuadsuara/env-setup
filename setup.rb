#!/usr/bin/env ruby

require 'fileutils'

def symlink(relative_file, destination)
  filepath = File.join(working_dir, relative_file)

  sym_link = File.expand_path(destination)

  FileUtils.rm sym_link if File.symlink?(sym_link) || File.exist?(sym_link)
  FileUtils.ln_s filepath, sym_link
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

symlink("bin", "~/bin")

Dir.glob("dotfiles/*").each do |file|
  filename = File.basename(file)
  symlink(file, "~/.#{filename}")
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
