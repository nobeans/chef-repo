#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright 2013, nobeans
#
# All rights reserved - Do Not Redistribute
#

user = "vagrant"

%w{.bashrc .vimrc}.each do |file|
  cookbook_file "/home/#{user}/#{file}" do
    source file.sub(/^./, '_')
    owner user
    group user
    mode  0644
  end
end

