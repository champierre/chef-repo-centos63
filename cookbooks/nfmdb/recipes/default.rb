#
# Cookbook Name:: nfmdb
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory "#{node['nfmdb']['home']}/nfmdb_releases" do
  user node['user']
  group node['group']
  mode '775'
  action :create
end

directory "#{node['nfmdb']['home']}/shared" do
  user node['user']
  group node['group']
  mode '775'
  action :create
end
