#!/usr/bin/env ruby

require 'fileutils'

working_dir = File.expand_path(File.dirname(__FILE__))
dot_files = [".vim", ".vimrc", ".tmux.conf"]
  .map{|file| File.join(working_dir, file)}

home_dir = File.expand_path("~")
dot_files.each do |filename|
  sym_link = File.join(home_dir, File.basename(filename))

  FileUtils.rm sym_link if File.symlink?(sym_link) || File.exist?(sym_link)
  FileUtils.ln_s filename, sym_link
end

FileUtils.mkdir File.join(home_dir, ".tmp")
