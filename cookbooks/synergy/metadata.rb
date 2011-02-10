maintainer       "Ryan J. Geyer"
maintainer_email "me@ryangeyer.com"
license          "All rights reserved"
description      "Installs/Configures synergy"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"

depends "osx"

recipe "osx::install", "Installs the Synergy binaries"