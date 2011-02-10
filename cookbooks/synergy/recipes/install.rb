#
# Cookbook Name:: synergy
# Recipe:: install
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

include_recipe "osx::enable_root"

synergy_dir="/tmp/synergy-install"
synergy_zip="#{synergy_dir}/synergy.zip"

install_dir="/Library/Synergy"
bin_dir="#{install_dir}/bin"

directory bin_dir do
  recursive true
  action :create
end

directory synergy_dir do
  recursive true
  action :create
end

remote_file synergy_zip do
  source "http://synergy.googlecode.com/files/synergy-1.3.6p2-MacOSX-Universal.zip"
end

bash "Unzip synergy download" do
  code <<EOF
  unzip #{synergy_zip} -d #{install_dir}
  mv #{install_dir}/synergy* #{bin_dir}/
EOF
  not_if { File.exists?("#{install_dir}/bin/synergyc")}
end

osx_add_bin_path "synergy" do
  path bin_dir
end

directory synergy_dir do
  recursive true
  action :delete
end