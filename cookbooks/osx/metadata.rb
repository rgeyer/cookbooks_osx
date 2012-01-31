maintainer       "Ryan J. Geyer"
maintainer_email "me@ryangeyer.com"
license          "All rights reserved"
description      "Installs/Configures osx"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"

recipe "osx::default", "Sets up OSX how I like it"
recipe "osx::setup_colored_ls", "Adds colored output to ls for bash and csh"
recipe "osx::do_enable_root", "Enables the \"root\" user"
recipe "osx::do_disable_root", "Disables the \"root\" user"
recipe "osx::setup_keybindings", "Sets up default for home, end, pgup, pgdown"

attribute "osx/admin_user",
  :display_name => "OSX Admin User",
  :description => "The username of a user with administrative privileges",
  :required => "required",
  :recipes => ["osx::do_enable_root", "osx::do_disable_root"]

attribute "osx/admin_pass",
  :display_name => "OSX Admin Password",
  :description => "The password of a user with administrative privileges",
  :required => "required",
  :recipes => ["osx::do_enable_root", "osx::do_disable_root"]

attribute "osx/root_password",
  :display_name => "OSX Root Password",
  :description => "The password you want to assign to the root account",
  :required => "required",
  :recipes => ["osx::do_enable_root"]
    
 attribute "osx/ls_colors",
   :display_name => "LSCOLORS Code",
   :description => "The ls colors code.  You can generate your favorite with something like this http://geoff.greer.fm/lscolors/",
   :required => "optional",
   :default => "exfxcxdxbxegedabagacad",
   :recipes => ["osx::setup_colored_ls"]