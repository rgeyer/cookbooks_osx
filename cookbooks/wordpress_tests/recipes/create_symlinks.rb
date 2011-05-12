#
# Cookbook Name:: wordpress-tests
# Recipe:: create_symlinks
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

# Link the tests directory
test_link = ::File.join(wptestcase_path, node[:wordpress_tests][:plugin_name])
test_link_src = ::File.join(node[:wordpress_tests][:project_path], node[:wordpress_tests][:project_wptests_path])

link test_link do
  to test_link_src
end

# Link this plugin directory to the test wordpress directory
# TODO: switch this to the stable wordpress directory which was copied in the instrument_project recipe
plugin_link = ::File.join(wptest_path, "wordpress", "wp-content", "plugins", node[:wordpress_tests][:plugin_name])
plugin_link_src = node[:wordpress_tests][:project_path]

link plugin_link do
  to plugin_link_src
end

fixtures_link = ::File.join(wptest_path, "wp-testdata", node[:wordpress_tests][:plugin_name])
fixtures_link_src = ::File.join(node[:wordpress_tests][:project_path], node[:wordpress_tests][:project_wptests_path], "fixtures")

link fixtures_link do
  to fixtures_link_src
end