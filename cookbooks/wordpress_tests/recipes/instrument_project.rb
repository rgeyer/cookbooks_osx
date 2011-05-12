#
# Cookbook Name:: wordpress-tests
# Recipe:: instrument_project
#
#  OSX Opscode Chef cookbooks
#  Copyright 2011 Ryan J. Geyer
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

wptest_path     = ::File.join(node[:wordpress_tests][:project_path], "wordpress-tests")
wptestcase_path = ::File.join(wptest_path, "wp-testcase")

subversion "Fetch the Wordpress Tests directory" do
  repository "http://svn.automattic.com/wordpress-tests/"
  destination wptest_path
  action :sync
end

# TODO: Grab the stable version of wordpress, so things don't break!

# Nuke all the built-in tests, we're only going to be testing with our own stuff
directory wptestcase_path do
  recursive true
  action [:delete, :create]
end

# Create the config file
template ::File.join(wptest_path, "wp-config.php") do
  source "wp-config.php.erb"
end

# TODO: Is this necessary?
#template ::File.join(wptest_path, "wordpress", "wp-config.php") do
#  source "wp-config.php.erb"
#end