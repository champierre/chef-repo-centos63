#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

ROOT_PASSWORD = 'chef'

package_names = [
  'MySQL-server',
  'MySQL-client',
  'MySQL-devel',
  'MySQL-shared-compat'
]

package_names.each do |package_name|
  rpm_file = "#{package_name}-5.6.10-1.el6.x86_64.rpm"

  cookbook_file "/tmp/#{rpm_file}" do
    mode 00644
  end

  package package_name do
    action :install
    source "/tmp/#{rpm_file}"
  end
end

service "mysql" do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end

execute "setpassword" do
  command "/usr/bin/mysqladmin -u root password " + ROOT_PASSWORD
  action :nothing
end

template "my.cnf" do
  path "/etc/my.cnf"
  source "my.cnf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, 'service[mysql]'
end