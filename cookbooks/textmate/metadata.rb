maintainer       "Ryan J. Geyer"
maintainer_email "me@ryangeyer.com"
license          "All rights reserved"
description      "Installs/Configures textmate"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"

depends "osx"

recipe "textmate::default", "Sets up textmate how I like it!"
recipe "textmate::install_bundles", "Installs (or updates) a list of bundles based on the textmate/bundles attribute"

attribute "textmate/bundles",
  :display_name => "Textmate Bundle Repos",
  :description => "A json hash of git repositories to checkout as Textmate bundles.  In the form {'<dirname>', '<repo_uri>'}, I.E. {'Ack.tmbundle', 'git://github.com/protocol/ack-tmbundle.git'}",
  :type => "string",
  :default => '{"Ack.tmbundle": "git://github.com/protocool/ack-tmbundle.git","RDoc.tmbundle": "git://github.com/joshaven/RDoc.tmbundle.git","PHP.tmbundle": "git://github.com/textmate/php.tmbundle.git","PHP-Smarty.tmbundle": "git://github.com/textmate/php-smarty.tmbundle.git"}',
  :recipes => ["textmate::install_bundles", "textmate::default"]