#!/usr/bin/env ruby

require 'fileutils'

def symlink(file, destination_folder)
  working_dir = File.expand_path(File.dirname(__FILE__))
  filename = File.join(working_dir, file)

  resolved_destination = File.expand_path(destination_folder)
  sym_link = File.join(resolved_destination, File.basename(filename))

  FileUtils.rm sym_link if File.symlink?(sym_link) || File.exist?(sym_link)
  FileUtils.ln_s filename, sym_link
end

[".vim", ".vimrc", ".tmux.conf"].each do |file|
  symlink(file, "~")
end
