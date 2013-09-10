#
# Cookbook Name:: image_magick
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# cookbook_file "/tmp/jpegsrc.v6b.tar.gz" do
#   mode 00644
# end

cookbook_file "/tmp/libjpeg-6b-37.x86_64.rpm" do
  mode 00644
end

cookbook_file "/tmp/ImageMagick.tar.gz" do
  mode 00644
end

package "libjpeg" do
  action :install
  source "/tmp/libjpeg-6b-37.x86_64.rpm"
end

bash "install ImageMagick" do
  not_if "which convert"
  user "root"
  cwd "/tmp"
  code <<-EOC
    tar -zxf ImageMagick.tar.gz
    (cd ImageMagick-6.8.6-9 && ./configure && make && make install)
  EOC
end