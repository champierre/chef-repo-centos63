#
# Cookbook Name:: set_gitconfig
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template ".gitconfig" do
  path "#{node['home']}/.gitconfig"
  source ".gitconfig.erb"
  owner node['owner']
  group node['group']
  mode 0644
end