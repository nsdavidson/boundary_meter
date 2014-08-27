#
# Cookbook Name:: boundary_meter
# Recipe:: default
#
# Copyright (C) 2014 Nolan Davidson
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'chef-sugar::default'

if node[:boundary][:meter][:enabled]
  include_recipe 'boundary_meter::install'
  include_recipe 'boundary_meter::enable'
else
  include_recipe 'boundary_meter::disable'
end
