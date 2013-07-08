#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package_names = [
  'MySQL-server',
  'MySQL-client',
  'MySQL-devel',
  'MySQL-shared-compat',
  'MySQL-shared'
]

remote_uri = "http://ftp.jaist.ac.jp/pub/mysql/Downloads/MySQL-5.6/"

package_names.each do |package_name|
  rpm_file = "#{package_name}-5.6.10-1.el6.x86_64.rpm"

  remote_file "/tmp/#{rpm_file}" do
    source "#{remote_uri}#{rpm_file}"
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

template "my.cnf" do
  path "/etc/my.cnf"
  source "my.cnf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, 'service[mysql]'
end