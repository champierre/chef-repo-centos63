#
# Cookbook Name:: rvm
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash "install-rvm" do
  not_if 'which rvm'
  user node['user']
  group node['group']
  cwd node['home']
  environment "HOME" => node['home']
  code <<-EOC
    LANG=ja_JP.UTF-8
    LC_ALL=ja_JP.UTF-8
    curl -L https://get.rvm.io | bash -s stable --rails
  EOC
end