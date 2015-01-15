#
# Author::  Tim Whitney (<tim.d.whitney@gmail.com>)
# Cookbook Name:: drupal
# Recipe:: drush
#
# Copyright 2013, Tim Whitney
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
include_recipe 'composer'

# Install Drush via composer
bash 'Install Drush' do
  user 'root'
  cmd = "composer global require drush/drush:#{node[:drupal][:drush][:revision]}"
  code <<-EOH
    set -x
    set -e
    #{cmd}
  EOH
end

link node[:drupal][:drush][:executable] do
  to "#{node[:drupal][:drush][:dir]}/drush"
  link_type :symbolic
end
