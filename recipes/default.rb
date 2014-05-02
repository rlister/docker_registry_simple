#
# Cookbook Name:: docker_registry_simple
# Recipe:: default
#
# Copyright 2014, Richard Lister
#
# All rights reserved - Do Not Redistribute
#

include_recipe "docker_registry_simple::install"
include_recipe "docker_registry_simple::config"
include_recipe "docker_registry_simple::service"
