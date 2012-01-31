#
# Cookbook Name:: osx
# Recipe:: colored_ls
#
#  Copyright 2011 Ryan J. Geyer
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

# TODO: Maybe just append rather than replacing the files?

template ::File.join(ENV['HOME'], '.cshrc') do
  backup false
  source "cshrc.erb"
end

template ::File.join(ENV['HOME'], '.bash_profile') do
  backup false
  source "bashrc.erb"
end