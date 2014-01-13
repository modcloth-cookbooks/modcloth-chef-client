#
# Cookbook Name:: chef-client
# Recipe:: default
#
# Copyright (c) 2013 ModCloth, Inc.
#
# MIT License
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
# of the Software, and to permit persons to whom the Software is furnished to do
# so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

directory '/var/log/chef'

package 'procmail' # to get `lockfile`

ccw_path = "#{node['install_prefix']}/chef-client-wrapper"

template ccw_path do
  source 'chef-client-wrapper.erb'
  cookbook 'modcloth-chef-client'
  mode 0755
end

cron 'chef-client' do
  minute node['modcloth_chef_client']['cron_minute']
  hour node['modcloth_chef_client']['cron_hour']
  day node['modcloth_chef_client']['cron_day']
  month node['modcloth_chef_client']['cron_month']
  weekday node['modcloth_chef_client']['cron_weekday']

  command ccw_path
end

unless node.recipe?('chef-server')
  file Chef::Config[:validation_key] do
    action :delete
    backup false
    only_if { ::File.exists?(Chef::Config[:client_key]) }
  end
end
