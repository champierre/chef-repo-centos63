#
# Cookbook Name:: app
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory "#{node['app']['parent_folder']}/#{node['app']['name']}_releases" do
  user node['user']
  group node['group']
  mode '775'
  action :create
end

directory "#{node['app']['parent_folder']}/shared" do
  user node['user']
  group node['group']
  mode '775'
  action :create
end
