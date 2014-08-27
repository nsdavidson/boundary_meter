if rhel?
  include_recipe 'boundary_meter::yum_repo'
  include_recipe 'boundary_meter::install_linux'
elsif ubuntu?
  include_recipe 'boundary_meter::apt_repo'
  include_recipe 'boundary_meter::install_linux'
elsif windows?
  include_recipe 'boundary_meter::install_windows'
end
