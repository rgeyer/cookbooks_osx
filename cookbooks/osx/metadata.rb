maintainer       "Ryan J. Geyer"
maintainer_email "me@ryangeyer.com"
license          "All rights reserved"
description      "Installs/Configures osx"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"

recipe "osx::enable_root", "Enables the \"root\" user"
recipe "osx::disable_root", "Disables the \"root\" user"

attribute "osx/admin_user",
  :display_name => "OSX Admin User",
  :description => "The username of a user with administrative privileges",
  :required => "required",
  :recipes => ["osx::enable_root", "osx::disable_root"]

attribute "osx/admin_pass",
  :display_name => "OSX Admin Password",
  :description => "The password of a user with administrative privileges",
  :required => "required",
  :recipes => ["osx::enable_root", "osx::disable_root"]

attribute "osx/root_password",
  :display_name => "OSX Root Password",
  :description => "The password you want to assign to the root account",
  :required => "required",
  :recipes => ["osx::enable_root"]