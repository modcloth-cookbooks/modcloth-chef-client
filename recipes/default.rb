#
# Cookbook Name:: chef-client
# Recipe:: default
#
# Copyright ModCloth, Inc.
#
# All rights reserved - Do Not Redistribute
#

directory "/var/log/chef" do
  action :create
end

cookbook_file "/tmp/run_chef.sh" do
  source "run_chef.sh"
  mode "0755"
end

cron "chef-client" do
  minute '0,15,30,45'
  command "/tmp/run_chef.sh 2>&1 > /var/log/chef/client.log"
end

unless node[:recipes].include?("chef-server")
  file Chef::Config[:validation_key] do
    action :delete
    backup false
    only_if { ::File.exists?(Chef::Config[:client_key]) }
  end
end

