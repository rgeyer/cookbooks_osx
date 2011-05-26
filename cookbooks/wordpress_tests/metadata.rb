maintainer       "Ryan J. Geyer"
maintainer_email "me@ryangeyer.com"
#license          IO.read(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'LICENSE')))
description      "Installs/Configures wordpress_tests"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"

supports "osx"

recipe "wordpress_tests::instrument_project", "Sets up a wordpress plugin directory to be integration testable using the wordpress-tests from http://codex.wordpress.org/Automated_Testing"
recipe "wordpress_tests::create_symlinks", "Creates some symlinks to make the tests work.  This is seperate because you may want to ignore some of the content under 'wordpress-tests' so your IDE doesn't go into convulsions"

attribute "wordpress_tests/plugin_name",
  :display_name => "Wordpress Plugin name",
  :required => "required",
  :recipes => ["wordpress_tests::instrument_project"]

attribute "wordpress_tests/project_path",
  :display_name => "Wordpress plugin project path",
  :required => "required",
  :recipes => ["wordpress_tests::instrument_project"]

attribute "wordpress_tests/project_wptests_path",
  :display_name => "Path (relative to wordpress_tests/project_path) to the Wordpress tests",
  :required => "required",
  :recipes => ["wordpress_tests::instrument_project"]

attribute "wordpress_tests/dbname",
  :display_name => "Wordpress Tests Database Name",
  :required => "required",
  :recipes => ["wordpress_tests::instrument_project"]

attribute "wordpress_tests/dbuser",
  :display_name => "Wordpress Tests Database Username",
  :required => "required",
  :recipes => ["wordpress_tests::instrument_project"]

attribute "wordpress_tests/dbpass",
  :display_name => "Wordpress Tests Database User Password",
  :required => "optional",
  :recipes => ["wordpress_tests::instrument_project"]

attribute "wordpress_tests/dbhost",
  :display_name => "Wordpress Tests Database Host",
  :required => "optional",
  :default => "localhost",
  :recipes => ["wordpress_tests::instrument_project"]

attribute "wordpress_tests/dbcharset",
  :display_name => "Wordpress Tests Database Charset",
  :required => "optional",
  :default => "utf8",
  :recipes => ["wordpress_tests::instrument_project"]

attribute "wordpress_tests/dbcollate",
  :display_name => "Wordpress Tests Database Collate setting",
  :required => "optional",
  :recipes => ["wordpress_tests::instrument_project"]