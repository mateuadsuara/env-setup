#!/usr/bin/env ruby

base_path = ARGV[0] || '~'

require 'fileutils'

def symlink(relative_file, destination)
  filepath = File.join(working_dir, relative_file)

  sym_link = File.expand_path(destination)

  if File.exist?(sym_link)
    if File.symlink?(sym_link)
      FileUtils.rm sym_link
    else
      raise "#{sym_link} exists and is not a symlink! Cannot delete it to create the symlink assuming it will be fine :("
    end
  end
  FileUtils.ln_s filepath, sym_link
end

def working_dir
  File.expand_path(File.dirname(__FILE__))
end

def install_vim_plugin(git_repo, base_path)
  IO.popen("git")
  repo_name = git_repo.split("/")[1]
  system("git clone https://github.com/#{git_repo} #{base_path}/.vim/bundle/#{repo_name}")
  system('vim -u NONE -c "Helptags" -c q')
end

def mkdir(dir)
  FileUtils.mkdir_p File.expand_path(dir)
end

mkdir("#{base_path}/.tmp")
mkdir("#{base_path}/bin")

Dir.glob("bin/*").each do |file|
  filename = File.basename(file)
  symlink(file, "#{base_path}/bin/#{filename}")
end

Dir.glob("dotfiles/*").each do |file|
  filename = File.basename(file)
  symlink(file, "#{base_path}/.#{filename}")
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

  "tpope/vim-projectionist",

  "elmcast/elm-vim",
  "elixir-lang/vim-elixir.git",
  "rust-lang/rust.vim",
  "leafgarland/typescript-vim.git",
  "peitalin/vim-jsx-typescript.git",
].each do |plugin|
  install_vim_plugin(plugin, base_path)
end
