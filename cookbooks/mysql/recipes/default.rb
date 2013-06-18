#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

["mysql-server", "mysql", "mysql-devel"].each do |package_name|
	package package_name do
		version node['mysql']['version']
		action :install
	end
end

service "mysqld" do
	supports :status => true, :restart => true, :reload => true
	action [:enable, :start]
end

template "my.cnf" do
	path "/etc/my.cnf"
	source "my.cnf.erb"
	owner "root"
	group "root"
	mode 0644
	notifies :restart, 'service[mysqld]'
end