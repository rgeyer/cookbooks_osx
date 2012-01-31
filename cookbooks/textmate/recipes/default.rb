#
# Cookbook Name:: textmate
# Recipe:: default
#
# Copyright 2012, Ryan J. Geyer <me@ryangeyer.com>
#
# All rights reserved - Do Not Redistribute
#

include_recipe "osx::setup_keybindings"
include_recipe "textmate::install_bundles"