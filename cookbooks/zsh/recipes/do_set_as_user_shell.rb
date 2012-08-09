#
# Cookbook Name:: zsh
# Recipe:: do_set_as_user_shell
#
#  Copyright 2012 Ryan J. Geyer
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

zsh_path = `which zsh`

# This probably could be handled by an "install" recipe
ruby_block "Check if zsh is installed first" do
  block do
    raise "Looks like zsh is not yet installed or in your path, please rectify that first"
  end
  only_if { zsh_path.empty? }
end

bash "Add zsh to acceptable shells for users" do
  user 'root'
  code <<EOF
sh -c "echo '#{zsh_path}'" >> /etc/shells
EOF
  only_if { `grep '#{zsh_path}' /etc/shells`.empty? }
end

bash "Set zsh as the default shell for current user" do
  code "chsh -s #{zsh_path}"
end