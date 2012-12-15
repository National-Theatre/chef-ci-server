#
# Cookbook Name:: ci_server
# Recipe:: default
#
# Copyright 2012, National Theatre
#
# All rights reserved - Do Not Redistribute
#

#%w(git URLSCM build-publisher checkstyle cloverphp dry htmlpublisher jdepend plot pmd violations xunit).each do |plugin|
#  jenkins_cli "install-plugin #{plugin}"
#  jenkins_cli "safe-restart"
#end

cookbook_file "#{node['nginx']['dir']}/conf.d/default.conf" do
  source "nginx_default.conf"
  owner "root"
  group "root"
  mode 00644
  notifies :reload, 'service[nginx]'
end

cookbook_file "/usr/share/nginx/html/index.html" do
  source "index.html"
  owner "root"
  group "root"
  mode 00644
end

template "#{node['nginx']['dir']}/sites-available/ci-server" do
  source "ci-site.erb"
  owner "root"
  group "root"
  mode 00644
  notifies :reload, 'service[nginx]'
end

nginx_site 'ci-server' do
  enable true
end