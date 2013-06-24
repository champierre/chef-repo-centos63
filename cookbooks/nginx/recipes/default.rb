#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'yum::epel'

# Install dependencies
cookbook_file "/tmp/libgd2-2.0.33-2_11.el6.x86_64.rpm" do
  mode 00644
end

package "libgd" do
  action :install
  source "/tmp/libgd2-2.0.33-2_11.el6.x86_64.rpm"
end

cookbook_file "/tmp/gd-2.0.35-11.el6.x86_64.rpm" do
  mode 00644
end

package "gd" do
  action :install
  source "/tmp/gd-2.0.35-11.el6.x86_64.rpm"
end

package "nginx" do
	action :install
end

service "nginx" do
	supports :status => true, :restart => true, :reload => true
	action [:enable, :start]
end

template "nginx.conf" do
	path "/etc/nginx/nginx.conf"
	source "nginx.conf.erb"
	owner "root"
	group "root"
	mode 0644
	notifies :reload, 'service[nginx]'
end