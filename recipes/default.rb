#
# Cookbook Name:: boundary_meter
# Recipe:: default
#
# Copyright (C) 2014 Nolan Davidson
#
#

include_recipe 'chef-sugar::default'

if node[:boundary][:meter][:enabled]
  include_recipe 'boundary_meter::install'
else
  include_recipe 'boundary_meter::disable'
end
